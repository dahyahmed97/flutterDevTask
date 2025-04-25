import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdevtask/core/error/exceptions.dart';
import 'package:flutterdevtask/core/helpers/constants/endpoint_constants.dart';
import 'package:flutterdevtask/core/http/network_config/network_response.dart';

abstract class INetworkClient {
  Future<NetworkResposne> get(
    String url, {
    Map<String, dynamic>? headers,
    String? data,
    Map<String, dynamic> queryParam,
  });

  Future<NetworkResposne> post(
    String url,
    bool uploadFile, {
    Map<String, dynamic>? headers,
    dynamic data,
    Map<String, dynamic> queryParam,
  });

  Future<NetworkResposne> put(
    String url, {
    Map<String, dynamic>? headers,
    dynamic data,
  });

  Future<NetworkResposne> delete(
    String url, {
    Map<String, dynamic>? headers,
    dynamic data,
  });

  Future<Uint8List> downloadFile(String url, {Map<String, dynamic>? headers});

  // Future<NetworkResposne> uploadFile(File file, String url,
  //     {Map<String, dynamic>? headers});
  //Future<Uint8List?> downloadDocument(String url);
}

class NetworkClient implements INetworkClient {
  final dio = Dio();
  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
  //     client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  //     return client;
  // };

  NetworkClient() {
    BaseOptions options = BaseOptions(
      baseUrl: EndPointsConstants.baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    );
    dio.options = options;
  }

  NetworkResposne getNetworkResponse(Response response) {
    return NetworkResposne(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<NetworkResposne> get(
    String url, {
    Map<String, dynamic>? headers,
    String? data,
    Map<String, dynamic>? queryParam,
  }) async {
    try {
      Response response = await dio.get(
        url,
        options: Options(headers: headers),
        queryParameters: queryParam,
      );
      if (kDebugMode) {
        print("res:$response");
      }
      return getNetworkResponse(response);
    } on DioException catch (e) {
      //logger(e);

      if (e.type == DioExceptionType.badResponse) {
        return getNetworkResponse(e.response!);
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw NetworkException();
      }
      throw ServerException(e.message ?? "unhandeled error occured !");
    }
  }

  // logger(DioException e) async {
  //   await FirebaseCrashlytics.instance.setCustomKey('type', e.type.toString());
  //   await FirebaseCrashlytics.instance
  //       .setCustomKey('response', e.response.toString());
  //   await FirebaseCrashlytics.instance
  //       .setCustomKey('message', e.message.toString());
  //   // await FirebaseCrashlytics.instance.setCustomKey('type', e.type);
  //   await FirebaseCrashlytics.instance.recordError(
  //     e,
  //     e.stackTrace,
  //     reason: 'Unexpected error occurred',
  //     fatal: true,
  //   );
  // }

  @override
  Future<NetworkResposne> post(
    String url,
    bool uploadFile, {
    Map<String, dynamic>? headers,
    dynamic data,
    Map<String, dynamic>? queryParam,
  }) async {
    dio.options.baseUrl = EndPointsConstants.baseUrl;
    try {
      dio.options.headers.clear();
      dio.options.headers.addAll(headers!);

      if (kDebugMode) {
        print("Request Details:");
        if (uploadFile == false) {
          print("requestJson: ${jsonEncode(data)}");
        }
        print("URL: ${dio.options.baseUrl}$url");
        print("Headers: ${jsonEncode(headers)}");
        print("Query Parameters: ${jsonEncode(queryParam)}");
        // print("Request-Body: ${jsonEncode(data)}");
      }

      final response = await dio.post(
        url,
        options: Options(headers: headers),
        queryParameters: queryParam,
        data: data,
      );
      if (kDebugMode) {
        print("res:$response");
      }
      return getNetworkResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return getNetworkResponse(e.response!);
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw NetworkException();
      }
      throw const ServerException("");
    }
  }

  @override
  Future<NetworkResposne> put(
    String url, {
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response = await dio.put(
        url,
        options: Options(headers: headers),
        data: data,
      );
      return getNetworkResponse(response);
    } on DioException catch (e) {
      //logger(e);
      if (e.type == DioExceptionType.badResponse) {
        return getNetworkResponse(e.response!);
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw NetworkException();
      }

      throw const ServerException("");
    }
  }

  //@override
  // Future<Uint8List?> downloadDocument(String url) async {
  //   try {
  //     var res = await dio.get(
  //       url,
  //       options: Options(responseType: ResponseType.bytes),
  //     );
  //     if (res.statusCode == 200) {
  //       return res.data;
  //     } else {
  //       return null;
  //     }
  //   } on Exception catch (_, exp) {
  //     print(exp);
  //   }
  // }

  @override
  Future<NetworkResposne> delete(
    String url, {
    Map<String, dynamic>? headers,
    data,
  }) async {
    try {
      final response = await dio.delete(
        url,
        options: Options(headers: headers),
        data: data,
      );
      return getNetworkResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return getNetworkResponse(e.response!);
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw NetworkException();
      }

      throw const ServerException("");
    }
  }

  @override
  Future<Uint8List> downloadFile(
    String url, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      // Send a GET request with streaming response type
      Response<ResponseBody> response = await dio.get<ResponseBody>(
        url,
        options: Options(headers: headers, responseType: ResponseType.stream),
      );

      if (kDebugMode) {
        print("Response received: ${response.statusCode}");
      }

      // Initialize a list to hold byte chunks
      List<int> bytes = [];
      final stream = response.data!.stream;

      // Read the stream and append chunks to the byte list
      await for (final chunk in stream) {
        bytes.addAll(chunk);
      }

      // Convert the byte list into Uint8List
      return Uint8List.fromList(bytes);
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        throw const ServerException("500 | internal server error");
      }
      if (e.type == DioExceptionType.badResponse) {
        throw NetworkException();
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.unknown) {
        throw NetworkException();
      }
      throw ServerException(e.message ?? "Unhandled error occurred!");
    }
  }

  // @override
  // Future<NetworkResposne> uploadFile(File file, String url,
  //     {Map<String, dynamic>? headers}) async {
  //   var formData = FormData.fromMap({
  //     'file': await MultipartFile.fromFile(file.path, filename: "image"),
  //   });
  //   dio.options.baseUrl = EndPointsConstants.attachmentBaseUrl;
  //   return post(url, data: formData);
  // }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
