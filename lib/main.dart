import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/redux/AppState.dart';
import 'package:flutter_test_coffe_app2/pages/home.dart';
import 'package:flutter_test_coffe_app2/redux/app_reducer.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = new Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primaryColor: Colors.blue[900],
          accentColor: Colors.red[700]
        ),
        home: new Scaffold(
          appBar: new AppBar(title: Text("test app"),),
          body: new HomeScreen(),
        ),
      ),
    );
  }
}

