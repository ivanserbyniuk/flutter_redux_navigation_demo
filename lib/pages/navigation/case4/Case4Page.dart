import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/AppState.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case4/ViewModel.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Case4Page extends StatelessWidget {

  Widget build(BuildContext context) =>
      StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) =>
            Scaffold(appBar: _buildAppbar(viewModel),
              bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
                  canvasColor: viewModel.themeColor,
                  primaryColor: viewModel.textColor,
                  textTheme: Theme
                      .of(context)
                      .textTheme
                      .copyWith(caption: new TextStyle(color: viewModel.textColor))),
                child: BottomNavigationBar(
                    items: viewModel.bottomTabsIcons.map((item) =>
                    new BottomNavigationBarItem(icon: Icon(item.icon), title: Text(item.text)))
                        .toList()),
              ),
              drawer: _buildDrawer(context, viewModel),
            ),
      );

  _buildAppbar(ViewModel viewModel) =>
      new AppBar(flexibleSpace: new Image.asset(viewModel.drawerHeaderImage,
        fit: BoxFit.fitWidth,
      ), actions: <Widget>[IconButton(icon: Icon(Icons.pin_drop, color: viewModel.themeColor,), onPressed: () {})],);

  _buildDrawer(BuildContext context, ViewModel viewModel) {
    createTile(IconData iconData, int index) =>
        ListTile(
          leading: Icon(iconData),
          title: Text("Button $index"),
          onTap: (){
            Navigator.pop(context);
            viewModel.onNewItem(index-1);},
        );
    return Drawer(
      child: Column(children: <Widget>[
        DrawerHeader(
          child: Container(),
          decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(viewModel.drawerHeaderImage),
              fit: BoxFit.fill)),),
        createTile(Icons.map, 1),
        createTile(Icons.insert_drive_file, 2),
        createTile(Icons.wb_sunny, 3)
      ],
      ),
    );
  }
}
