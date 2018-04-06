import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case1/Case1Screen.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/Case2Page.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case3/Case3Page.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case4/Case4Page.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case6/Case6Page.dart';
import 'package:flutter_test_coffe_app2/utils/utils.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildButtons(context),
    );
  }

  _buildButtons(BuildContext context) =>
      Column(children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 24.0),),
        buildButton(context, label: "Use case 1", routeTo: new Case1Screen(0)),
        buildButton(context, label: "Use case 2", routeTo: new Case2Screen()),
        buildButton(context, label: "Use case 3", routeTo: new Case3Page()),
        buildButton(context, label: "Use case 4", routeTo: new Case4Page()),
        buildButton(context, label: "Use case 5", routeTo: null),
        buildButton(context, label: "Use case 6", routeTo: new Case6Page()),

      ],);
}