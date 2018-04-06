import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Case1Screen extends StatelessWidget {
  String screenName;
  var states = ["A", "B", "C", "M", "N", "D"];
  var currentIndex = 0;

  Case1Screen(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    final title = "Screen ${states[currentIndex]}";
    final isLastPosition = currentIndex == states.length - 1;
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Container(child: Center(
        child: Text(title, style: TextStyle(fontSize: 20.0),),),),
      floatingActionButton: isLastPosition ? null : FloatingActionButton(
          child: Text(states[currentIndex + 1],
            style: TextStyle(fontSize: 20.0, color: Colors.white),),
          onPressed: () => toNext(context)
      ),
    );
  }

  toNext(context) {
    var nextIndex = currentIndex + 1;
    var lastModal = states[nextIndex] == "D";
/*    if (lastModal) {
      Navigator.push(context, new MaterialPageRoute<DismissDialogAction>(
          builder: (BuildContext context) => new FullScreenDialogDemo()	                 builder: (BuildContext context) => new FullScreenDialogDemo()
    ));
    }else*/
     {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => Case1Screen(nextIndex),
          fullscreenDialog: states[nextIndex] == "M" ));
    }
  }
}