import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecureWebView extends StatefulWidget {
  final String url;
  const SecureWebView({super.key, required this.url});

  @override
  State<SecureWebView> createState() => _SecureWebViewState();
}

class _SecureWebViewState extends State<SecureWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
    // Enable secure screen (Android) and start observing (iOS)
    // _setSecureScreen(true);
  }

  @override
  void dispose() {
    // Disable secure screen when WebView is closed
    //  _setSecureScreen(false);
    super.dispose();
  }

  // Method to toggle secure screen via platform channels
  // Future<void> _setSecureScreen(bool secure) async {
  //   try {
  //     await const MethodChannel('com.example/secure').invokeMethod(
  //       'setSecure',
  //       {'secure': secure},
  //     );
  //   } catch (e) {
  //     debugPrint('Error setting secure screen: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
