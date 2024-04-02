import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: web(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    ),
  );
}

class web extends StatefulWidget {
  @override
  _webState createState() => _webState();
}

class _webState extends State<web> {
  TextEditingController SearchController = TextEditingController();
  String url_http = "https://";
  String url_web = "https://google.com";
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  void launch_web_Url() {
    url_web = SearchController.text;
    flutterWebviewPlugin.reloadUrl(url_http+url_web);
  }

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {});
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url_web,
      appBar:PreferredSize(preferredSize: Size(0, 50),
        child:
        AppBar(backgroundColor: Colors.orangeAccent.shade200,
          title: TextField(
          autofocus: false,
          controller: SearchController,
          cursorColor: Colors.white,
          cursorWidth: 0.4,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launch_web_Url(),
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              wordSpacing: 1),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  letterSpacing: 1,
                  wordSpacing: 1),
          ),
        ),
      ),
      ),
    );
  }
}