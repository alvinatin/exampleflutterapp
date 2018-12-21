import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter App",
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {

  @override
  State createState() {
    return new MyHomeState();
  }
}

class MyHomeState extends State<HomePageWidget> {
  static const platform = const MethodChannel(
      'com.alvinatin.exampleflutterapp');


  MyHomeState() {
    platform.setMethodCallHandler(_handleMethod);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform Channel'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _showNativeView,
          child: Text("Show Native View"),),
      ),
    );
  }

  Future<Null> _showNativeView() async {
    await platform.invokeMethod('showNativeView');
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "message":
        debugPrint(call.arguments);
        return new Future.value("");
    }
  }
}
