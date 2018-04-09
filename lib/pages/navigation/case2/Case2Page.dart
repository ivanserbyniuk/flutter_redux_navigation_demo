import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/redux/AppState.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ScreenA.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ScreenD.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case2/ViewModel.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';


class Case2Screen extends StatelessWidget {
  final icons = [Icons.home, Icons.star_border, Icons.play_arrow];
  final names = ["A", "B", "C"];

  @override
  Widget build(BuildContext context) =>
      StoreConnector(
          converter: (Store<AppState> store) => TabViewModel.create(store),
          builder: (BuildContext context, TabViewModel viewModel) =>
              Scaffold(
                appBar: AppBar(title: Text("Use case 2",)),
                body: createContent(context, viewModel),
                bottomNavigationBar: _buildBottomTabs(viewModel),));

  Widget _buildBottomTabs(TabViewModel viewModel) {
    createNavigatorBarItem(int index) =>
        BottomNavigationBarItem(
          icon: Icon(icons[index]),
          title: Text("Screen ${names[index]}"),
        );
    return BottomNavigationBar(
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

  openNewScreen(BuildContext context, TabViewModel viewModel, String backButtonLabel, int screenIndex) async {
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new ScreenD(backButtonLabel, screenIndex)
        ));

    if (results != null && results.containsKey(ScreenD.KEY)) {
      viewModel.selectTab(results[ScreenD.KEY]);
    }
  }
}


