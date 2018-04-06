import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget buildButton(BuildContext context, {String label, Widget routeTo}) =>
    Container(child: RaisedButton(child: Text(label),
        onPressed: () => Navigator.push(context, new CupertinoPageRoute(builder: (BuildContext context) => routeTo),),
        padding: EdgeInsets.all(8.0)),
      margin: EdgeInsets.all(16.0),
    );


