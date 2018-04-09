import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test_coffe_app2/utils/utils.dart';

class Case1Screen extends StatelessWidget {
  final String name;
  final String actionName;
  final Function action;

  Case1Screen(this.name, this.actionName, this.action);

  @override
  Widget build(BuildContext context) {
    final title = "Screen $name";
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Container(child: Center(
        child: Text(title, style: TextStyle(fontSize: 20.0),),),),
      floatingActionButton: action == null ? null : FloatingActionButton(
          child: Text(actionName,
            style: TextStyle(fontSize: 20.0, color: Colors.white),),
          onPressed: () => action()
      ),
    );
  }
}

class AScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Case1Screen("A", "B", () =>
          Navigator.push(context, createRoute( BScreen(), name: "B")));
}

class BScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Case1Screen("B", "C", () =>
          Navigator.push(context, createRoute(CScreen(), name: "C")));

}

class CScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Case1Screen("C", "M", () =>
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => new ModalScreen(), fullscreenDialog: true)));
}

class ModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Case1Screen("M", "N", () {
        List<Route> routs = [];
        var cupertinoPageRoute = CupertinoPageRoute(
            builder: (context) => new NScreen(routs));
        routs.add(cupertinoPageRoute);
        return Navigator.push(context, cupertinoPageRoute);
      });

}

class NScreen extends StatelessWidget {
  final List<Route> currentRoute;

  NScreen(this.currentRoute);

  @override
  Widget build(BuildContext context) =>
      Case1Screen("N", "D", () {
        Route route = CupertinoPageRoute(builder: (context) => new DScreen(),);
        Navigator.of(context).removeRoute(currentRoute[0]);
        Navigator.of(context)
          ..pop()
          ..pushAndRemoveUntil(route, ModalRoute.withName('/A'));
      });
}

class DScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Case1Screen("D", "", null);
}




