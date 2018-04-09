import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget buildButton(BuildContext context,
    {String label, Widget routeTo, String routName = ""}) =>
    Container(child: RaisedButton(child: Text(label),
        onPressed: () =>
            Navigator.push(context,
              createRoute(routeTo, name: routName),),
        padding: EdgeInsets.all(8.0)),
      margin: EdgeInsets.all(16.0),
    );


Route createRoute(Widget widget, {String name}) {
  return CupertinoPageRoute(builder: (context) => widget,
      settings: RouteSettings(name: name));
}


