import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case6/Case6TextScreen.dart';
import 'package:flutter_test_coffe_app2/utils/utils.dart';

class Case6Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = "Screen D";
    return new Scaffold(
        appBar: new AppBar(title: new Text(title),),
        floatingActionButton: new FloatingActionButton(
            child: new Text("B", style: new TextStyle(fontSize: 20.0, color: Colors.white),),
            onPressed: () =>
                Navigator
                    .of(context)
                    .push(createRoute(new Case6TextScreen())
                )
        )
    );
  }
}
