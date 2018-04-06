import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/AppState.dart';
import 'package:redux/redux.dart';

class ViewModel {
  String drawerHeaderImage;
  Color themeColor;
  Color textColor;
  List<TabInfo> bottomTabsIcons;
  final Function onNewItem;

  ViewModel(SideBarMode currentMode, this.onNewItem) {
    print(currentMode);
    switch (currentMode) {
      case SideBarMode.one :
        drawerHeaderImage = "assets/images/coffee_01.jpg";
        themeColor = Colors.pink[200];
        textColor = Colors.red[700];
        bottomTabsIcons = [
          TabInfo(Icons.ac_unit, "b1/t1"),
          TabInfo(Icons.screen_rotation, "b1/t2"),
          TabInfo(Icons.warning, "b1/t3")
        ];
        break;
      case SideBarMode.two :
        drawerHeaderImage = "assets/images/coffee_02.jpg";
        themeColor = Colors.yellow[200];
        textColor = Colors.brown[500];
        bottomTabsIcons = [
          TabInfo(Icons.map, "b2/t1"),
          TabInfo(Icons.store, "b2/t2"),
          TabInfo(Icons.satellite, "b2/t3")
        ];
        break;
      case SideBarMode.three :
        drawerHeaderImage = "assets/images/coffee_03.webp";
        themeColor = Colors.orange[200];
        textColor = Colors.blue[900];

        bottomTabsIcons = [
          TabInfo(Icons.account_box, "b3/t1"),
          TabInfo(Icons.subject, "b3/t2"),
          TabInfo(Icons.input, "b2/t3")
        ];
        break;
    }
  }

  factory ViewModel.create(Store<AppState> store) {
    return ViewModel(store.state.sideBarMode, (int i) {
      store.dispatch(ChangeModeAction(SideBarMode.values[i]));
    });
  }
}

class TabInfo {
  IconData icon;
  String text;
  TabInfo(this.icon, this.text);
}

class ChangeModeAction {
  SideBarMode index;
  ChangeModeAction(this.index);
}
