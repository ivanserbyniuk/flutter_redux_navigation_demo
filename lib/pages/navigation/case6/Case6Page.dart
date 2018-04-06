import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case6/Case6TextScreen.dart';

class Case6Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = "Screen D";
    return Scaffold(
        appBar: AppBar(title: Text(title),),
        floatingActionButton: FloatingActionButton(
            child: Text("B", style: TextStyle(fontSize: 20.0, color: Colors.white),),
            onPressed: () =>
                Navigator
                    .of(context)
                    .push(new MaterialPageRoute(builder: (context) => new Case6TextScreen())
                )
        )
    );
  }
}
