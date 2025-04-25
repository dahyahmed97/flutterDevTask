import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutterdevtask/core/error/exceptions.dart';
import 'package:flutterdevtask/core/helpers/constants/app_constants.dart';
import 'package:flutterdevtask/core/helpers/enums/enums.dart';
import 'package:flutterdevtask/core/helpers/utils/preferences/pref_manager.dart';
import 'network_client.dart';
import 'network_response.dart';
import 'package:equatable/equatable.dart';

abstract class INetwork {
  Future<Map<String, dynamic>> get(
    String url, {
    bool auth = true,
    bool visitor = false,
  });

  Future<Map<String, dynamic>> post(
    String url,
    bool uploadFile, {
    dynamic data,
    bool auth = true,
    bool visitor = false,
    bool isExternal = false,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> put(
    String url, {
    dynamic data,
    bool auth = true,
    bool visitor = false,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> delete(
    String url, {
    dynamic data,
    bool auth = true,
    bool visitor = false,
    bool isExternal = false,
    Map<String, String>? headers,
  });

  Future<Uint8List> downloadFile(
    String url, {
    bool auth = true,
    bool visitor = false,
    bool isExternal = false,
    Map<String, String>? headers,
  });

  Future<Map<String, dynamic>> getAccessToken(String refreshToken);
}

class Network implements INetwork {
  //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  INetworkClient networkClient;
  String? refreshToken;
  RetrialRequest? oldRequest;
  Network({required this.networkClient});

  void saveGetRequest(String url) {
    oldRequest = null;
    oldRequest ??= RetrialRequest(method: HttpVerb.get, url: url);
    if (kDebugMode) {}
  }

  void savePostRequest(String url, dynamic data) {
    oldRequest = null;
    oldRequest ??= RetrialRequest(method: HttpVerb.post, url: url, data: data);

    if (oldRequest!.counter > 1) {
      oldRequest = null;
    }
  }

  void savePutRequest(String url, dynamic data) {
    oldRequest = null;
    oldRequest ??= RetrialRequest(method: HttpVerb.put, url: url, data: data);

    // if (RetrialRequest.counter > 1) {
    //   oldRequest = null;
    // }
  }

  void saveDeleteRequest(String url, dynamic data) {
    oldRequest = null;
    oldRequest ??= RetrialRequest(
      method: HttpVerb.delete,
      url: url,
      data: data,
    );

    // if (RetrialRequest.counter > 1) {
    //   oldRequest = null;
    // }
  }

  void disposeOldRequest() {
    oldRequest = null;
  }

  Future<Map<String, dynamic>> retryRequest() async {
    if (kDebugMode) {}

    if (oldRequest != null) {
      if (oldRequest!.method == HttpVerb.post) {
        return post(
          oldRequest!.url,
          oldRequest!.uploadFile,
          data: oldRequest!.data,
        );
      } else {
        return get(oldRequest!.url);
      }
    }
    disposeOldRequest();
    throw UnAuthorizedException();
  }

  @override
  Future<Map<String, dynamic>> get(
    String url, {
    bool auth = true,
    bool visitor = false,
    Map<String, String>? headers,
    Map<String, String>? queryParam,
  }) async {
    if (kDebugMode) {
      print(url);
    }
    var parsedUrl = "";

    parsedUrl = url;
    saveGetRequest(parsedUrl);
    Map<String, dynamic> query = {};
    if (queryParam != null) {
      query.addAll(queryParam);
    }
    final response = await networkClient.get(
      parsedUrl,
      headers: await getHeaders(auth, visitor, headers),
      queryParam: query,
    );

    return getResponse(response);
  }

  @override
  Future<Map<String, dynamic>> post(
    String url,
    bool uploadFile, {
    dynamic data,
    bool auth = true,
    bool visitor = false,
    bool isExternal = false,
    Map<String, String>? headers,
  }) async {
    //savePostRequest(url, data);
    // var hea = await getHeaders(auth, visitor, headers);
    var parsedUrl = "";

    parsedUrl = url;

    final response = await networkClient.post(
      parsedUrl,
      uploadFile,
      data: data,
      headers: await getHeaders(auth, visitor, headers),
    );
    return getResponse(response);
  }

  @override
  Future<Map<String, dynamic>> put(
    String url, {
    dynamic data,
    bool auth = true,
    bool visitor = false,
    Map<String, String>? headers,
  }) async {
    var parsedUrl = "";

    parsedUrl = url;

    savePutRequest(parsedUrl, data);
    final response = await networkClient.put(
      parsedUrl,
      data: data,
      headers: await getHeaders(auth, visitor, headers),
    );
    return getResponse(response);
  }

  Future<Map<String, dynamic>> getResponse(NetworkResposne response) async {
    if (response.statusCode == HttpStatus.ok) {
      disposeOldRequest();
      return response.data;
    } else if (response.statusCode == HttpStatus.unauthorized ||
        response.statusCode == HttpStatus.forbidden) {
      // navigatorKey.currentState?.pushNamedAndRemoveUntil(
      //   RoutesCatalog.loginScreen,
      //   (Route<dynamic> route) => false,
      // );
      throw UnAuthorizedException();
    } else if (response.statusCode == HttpStatus.upgradeRequired) {
      // Future.microtask(() {
      //   navigatorKey.currentState?.pushNamedAndRemoveUntil(
      //     RoutesCatalog.updateAppScreen,
      //     (Route<dynamic> route) => false,
      //   );
      // });

      throw UnAuthorizedException();
    } else if (response.statusCode == HttpStatus.internalServerError) {
      return response.data;
    } else {
      if (kDebugMode) {
        print("status Code  ${response.statusCode}");
        print("data  ${response.data}");
      }
      throw const ServerException("حدث خطأ");
    }
  }

  Future<Map<String, dynamic>> getHeaders(
    bool auth,
    bool visitor,
    Map<String, String>? otherHeaders,
  ) async {
    PrefManager preferenceManager = PrefManager();

    Map<String, dynamic> headers = {};
    headers.addAll({
      "Content-Type": "application/json; charset=Utf-8",
      'Accept': '*/*',
      "MOB-Ver": AppConstants.mobVer,

      // "accept-Encoding": "application/json; charset=Utf-8",
    });
    if (otherHeaders != null) {
      headers.addAll(otherHeaders);
    }

    if (visitor) {
    } else if (auth) {
      String? token = await preferenceManager.getAccessToken();
      if (token != null) {
        headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
        if (kDebugMode) {
          print('Access-Token: $token');
        }
      }
    }

    return headers;
  }

  @override
  Future<Map<String, dynamic>> getAccessToken(String refreshToken) {
    throw UnimplementedError();
  }

  // Future<Uint8List?> downloadDocument(String s) async {
  //   var res = await networkClient.downloadDocument(s);
  //   if (res != null) {
  //     return res;
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Future<Map<String, dynamic>> delete(
    String url, {
    data,
    bool auth = true,
    bool visitor = false,
    bool isExternal = false,
    Map<String, String>? headers,
  }) async {
    var parsedUrl = "";

    parsedUrl = url;

    final response = await networkClient.delete(
      parsedUrl,
      data: data,
      headers: await getHeaders(auth, visitor, headers),
    );
    return getResponse(response);
  }

  @override
  Future<Uint8List> downloadFile(
    String url, {
    bool auth = true,
    bool visitor = false,
    bool isExternal = false,
    Map<String, String>? headers,
  }) async {
    if (kDebugMode) {
      print(url);
    }
    var parsedUrl = "";

    parsedUrl = url;

    saveGetRequest(parsedUrl);
    //Map<String, dynamic> query = {};

    final response = await networkClient.downloadFile(
      parsedUrl,
      headers: await getHeaders(auth, visitor, headers),
    );

    return response;
  }
}

// ignore: must_be_immutable
class RetrialRequest extends Equatable {
  int counter = 0;
  HttpVerb method;
  String url;
  bool uploadFile;
  dynamic data;
  RetrialRequest({
    required this.method,
    required this.url,
    this.uploadFile = false,
    this.data,
  }) {
    counter++;
  }

  @override
  List<Object?> get props => [counter, method, url, data];
}
