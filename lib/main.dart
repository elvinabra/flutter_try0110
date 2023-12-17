import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWebView(),
    );
  }
}

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: WebView(
        initialUrl: 'https://imperfly.az', // Set your web app URL here
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _clearWebViewCache();
        },
        debuggingEnabled: true,
           navigationDelegate: (NavigationRequest request) {
        
          return NavigationDecision.navigate;
        },
        
      ),
      
    );
  }

  // Function to clear the WebView cache
  Future<void> _clearWebViewCache() async {
    await _controller.clearCache();
  }
}
