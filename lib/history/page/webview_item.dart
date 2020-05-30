import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  //WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    print('init call');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose call');
  }

  @override
  Widget build(BuildContext context) {
    
    print(widget.url);
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('WebView')),
        body: Scaffold(
          backgroundColor: Colors.white,
          body: WebView(
            initialUrl: widget.url,
          ),
        ));
  }
}