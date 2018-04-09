import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  final Widget mainButton;
  final String name;

  ScreenA(this.name, this.mainButton);

  @override
  Widget build(BuildContext context) {
    return Center(child:  Column(children: <Widget>[
      mainButton,
      Text("Screen $name", style: TextStyle(fontSize: 20.0,  fontWeight: FontWeight.bold),)
    ],mainAxisAlignment: MainAxisAlignment.spaceAround,
    ));
  }
}
