import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget buildButton(BuildContext context,
    {String label, Widget routeTo, String routName = ""}) =>
   new  Container(child: new RaisedButton(child: Text(label),
        onPressed: () =>
            Navigator.push(context,
              createRoute(routeTo, name: routName),),
        padding: new EdgeInsets.all(8.0)),
      margin:new  EdgeInsets.all(16.0),
    );

Route createRoute(Widget widget, {String name}) {
  return new CupertinoPageRoute(builder: (context) => widget,
      settings: new RouteSettings(name: name));
}


