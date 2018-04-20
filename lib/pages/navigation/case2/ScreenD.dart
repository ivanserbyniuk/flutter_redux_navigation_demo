import 'package:flutter/material.dart';

class ScreenD extends StatelessWidget {
  static const KEY = "backTo";
  final String buttonLabel;
  final int backScreenIndex;

  ScreenD(this.buttonLabel, this.backScreenIndex);

  @override
  Widget build(BuildContext context) {
    final title = "Screen D";
    return new Scaffold(
      appBar: new AppBar(title: new Text(title),),
      body:new  Container(child: new Center(
        child: Text(title, style: new TextStyle(fontSize: 20.0),),),),
      floatingActionButton: new FloatingActionButton(
          child: new Text(buttonLabel,
            style: new TextStyle(fontSize: 20.0, color: Colors.white),),
          onPressed: () =>
              Navigator.of(context).pop({KEY: backScreenIndex})
      ),
    );
  }
}
