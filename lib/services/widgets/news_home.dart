import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsHome extends StatelessWidget {

  final String url;
  final String title;
  NewsHome({this.url,this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: new Text(title),
      ),
      body: WebView(
        initialUrl: url,
      ),
      
    );
  }
}