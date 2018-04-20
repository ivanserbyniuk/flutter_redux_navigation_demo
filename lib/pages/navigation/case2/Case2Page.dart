import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/redux/AppState.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ScreenA.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ScreenD.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ViewModel.dart';
import 'package:flutter_test_coffe_app2/utils/utils.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


class Case2Screen extends StatelessWidget {
  final icons = [Icons.home, Icons.star_border, Icons.play_arrow];
  final names = ["A", "B", "C"];

  @override
  Widget build(BuildContext context) =>
      new StoreConnector(
          converter: (Store<AppState> store) => TabViewModel.create(store),
          builder: (BuildContext context, TabViewModel viewModel) =>
             new  Scaffold(
                appBar:new AppBar(title: new Text("Use case 2",)),
                body: createContent(context, viewModel),
                bottomNavigationBar: _buildBottomTabs(viewModel),));

  Widget _buildBottomTabs(TabViewModel viewModel) {
    createNavigatorBarItem(int index) =>
       new BottomNavigationBarItem(
          icon: new Icon(icons[index]),
          title: new Text("Screen ${names[index]}"),
        );
    return new BottomNavigationBar(
      currentIndex: viewModel.tabIndex,
      onTap: viewModel.selectTab,
      items: <BottomNavigationBarItem>[
        createNavigatorBarItem(0),
        createNavigatorBarItem(1),
        createNavigatorBarItem(2),
      ],);
  }

  Widget createContent(BuildContext context, TabViewModel viewModel) {
    Widget screen;
    switch (viewModel.tabIndex) {
      case 0 :
        screen = new ScreenA("A", createNavButton(icons[0], () =>
            openNewScreen(context, viewModel, "B", 1)));
        break;
      case 1 :
        screen = new ScreenA("B", createNavButton(icons[1], () =>
            openNewScreen(context, viewModel, "A", 0)));
        break;
      case 2 :
        screen = new ScreenA("C", new Icon(icons[2], size: 42.0,));
        break;
    }
    return screen;
  }

  Widget createNavButton(IconData icon, onPressed()) {
    return RaisedButton(onPressed: onPressed,
        child: Row(
          children: <Widget>[
            new Icon(icon),
            new Padding(padding: new EdgeInsets.symmetric(horizontal: 4.0),),
            new Text("Screen D")
          ],
          mainAxisSize: MainAxisSize.min,
        ));
  }

  openNewScreen(BuildContext context, TabViewModel viewModel, String backButtonLabel, int screenIndex) async {
    Map results = await Navigator.of(context)
        .push(createRoute(new ScreenD(backButtonLabel, screenIndex)));
    if (results != null && results.containsKey(ScreenD.KEY)) {
      viewModel.selectTab(results[ScreenD.KEY]);
    }
  }
}


