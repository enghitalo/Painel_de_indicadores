import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Taxi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primaryColorDark: Colors.black,
      ),
      title: 'Taxi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Ride(),
      ),
    );
  }
}

class Ride extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: WebView(
          initialUrl: "https://riders.uber.com/trips?offset=0",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
