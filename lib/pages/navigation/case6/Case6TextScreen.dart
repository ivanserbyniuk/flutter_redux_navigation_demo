import 'package:flutter/material.dart';

class Case6TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(title: Text("Screen B")),
          body: Container(child: new Center(child: new TextField(
            decoration: new InputDecoration(
              hintText: 'Here I am',
            ),
          ),), padding: EdgeInsets.all(16.0),));
  }
}
