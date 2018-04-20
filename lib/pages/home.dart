import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/NavigationPage.dart';
import 'package:flutter_test_coffe_app2/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 24.0),),
        buildButton(context, label: "Navigation", routeTo: new NavigationPage()),
        buildButton(context, label: "Filestorage and Photos", routeTo: new _EmptyWidget()),
        buildButton(context, label: "List", routeTo: new _EmptyWidget()),
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

}

class _EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text("Empty Screen",),),
        body: Center(child: Text("Empty screen"),),);

}
