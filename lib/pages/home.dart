import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/NavigationPage.dart';
import 'package:flutter_test_coffe_app2/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 24.0),),
        buildButton(context,label: "Navigation", routeTo: new NavigationPage()),
        buildButton(context,label: "Filestorage and Photos", ),
        buildButton(context,label: "List", ),
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}