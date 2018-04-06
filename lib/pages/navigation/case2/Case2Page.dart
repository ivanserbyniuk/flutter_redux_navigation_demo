
import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ScreenA.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ScreenD.dart';

class Case2Screen extends StatefulWidget {
  @override
  _Case2ScreenState createState() => new _Case2ScreenState();
}

class _Case2ScreenState extends State<Case2Screen> {
  int currentIndex = 0;
  final icons = [Icons.home, Icons.star_border, Icons.play_arrow];
  final names = ["A", "B", "C"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Use case 2",)),
      body: createContent(),
      bottomNavigationBar: _buildBottomTabs(),);
  }

  Widget _buildBottomTabs() {
    createNavigatorBarItem(int index) =>
        BottomNavigationBarItem(
          icon: Icon(icons[index]),
          title: Text("Screen ${names[index]}"),
        );
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: <BottomNavigationBarItem>[
        createNavigatorBarItem(0),
        createNavigatorBarItem(1),
        createNavigatorBarItem(2),
      ],);
  }

  Widget createContent() {
    Widget screen;
    switch (currentIndex) {
      case 0 :
        screen = new ScreenA("A", createNavButton(icons[0], () =>
            openNewScreen("B", 1)));
        break;
      case 1 :
        screen = new ScreenA("B", createNavButton(icons[1], () =>
            openNewScreen("A", 0)));
        break;
      case 2 :
        screen = new ScreenA("C", Icon(icons[2], size: 40.0,));
        break;
    }
    return screen;
  }

  Widget createNavButton(IconData icon, onPressed()) {
    return new RaisedButton(onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Icon(icon),
            Padding(padding: EdgeInsets.symmetric(horizontal: 4.0),),
            Text("Screen D")
          ],
          mainAxisSize: MainAxisSize.min,
        ));
  }

  openNewScreen(String backButtonLabel, int screenIndex) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new ScreenD(backButtonLabel, screenIndex)
        ));

    if (results != null && results.containsKey(ScreenD.KEY)) {
      setState(() => currentIndex = results[ScreenD.KEY]
      );
    }
  }
}
