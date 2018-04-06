import 'package:flutter/material.dart';

class ScreenD extends StatelessWidget {
  static final KEY = "backTo";
  String buttonLabel;
  int backScreenIndex;

  ScreenD(this.buttonLabel, this.backScreenIndex);

  @override
  Widget build(BuildContext context) {
    final title = "Screen D";
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Container(child: Center(
        child: Text(title, style: TextStyle(fontSize: 20.0),),),),
      floatingActionButton: FloatingActionButton(
          child: Text(buttonLabel,
            style: TextStyle(fontSize: 20.0, color: Colors.white),),
          onPressed: () =>
              Navigator.of(context).pop({KEY: backScreenIndex})
      ),
    );
  }
}
