import 'package:flutter/material.dart';


class Case3Page extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Use case 3"),
          actions: <Widget>[
            IconButton(icon: new Icon(Icons.lock_open, color: Colors.red,),
                onPressed: () => _lockScreen()),
          ],),
        body: TextField(
          decoration: InputDecoration(
            hintText: 'Type something',
          ),
        ));
  }

  void _lockScreen() {
  }
}




