import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
final String word;

  SecondScreen({Key key, this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Center(
        child: new Text(
          this.word,
          textScaleFactor: 2.0,
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway',
            decorationStyle: TextDecorationStyle.wavy,
          ),
        ),
      ),
    );
  }
}