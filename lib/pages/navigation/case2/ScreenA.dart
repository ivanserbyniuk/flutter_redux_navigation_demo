import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  final Widget mainButton;
  final String name;

  ScreenA(this.name, this.mainButton);

  @override
  Widget build(BuildContext context) {
    return new Center(child:  new Column(children: <Widget>[
      mainButton,
      new Text("Screen $name", style: new TextStyle(fontSize: 20.0,  fontWeight: FontWeight.bold),)
    ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ));
  }
}
