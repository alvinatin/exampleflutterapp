import 'dart:async';
import 'package:english_words/english_words.dart';
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
//      body: Center(
//        child: RaisedButton(
//          onPressed: _showNativeView,
//          child: Text("Show Native View"),),
//      ),
    body: RandomWords(),
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

class NormalListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("a"),
        Text("b"),
        Text("c"),
        Text("d"),
        Text("e"),
        Text("f"),
        Text("g"),
        Text("h"),
      ],
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

