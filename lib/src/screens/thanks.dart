import 'package:flutter/material.dart';

class ThanksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank You"),
      ),
      body: Center(
        child: new Image(
          image: NetworkImage("https://bit.ly/2DnQDnI"),
        )
      ),
    );
  }
}