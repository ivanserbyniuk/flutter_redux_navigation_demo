import 'package:flutter/material.dart';
import 'package:flutter_test_coffe_app2/AppState.dart';
import 'package:flutter_test_coffe_app2/pages/home.dart';
import 'package:flutter_test_coffe_app2/reducers/app_reducer.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer, /* Function defined in the reducers file */
    initialState: AppState.initial(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
          appBar: new AppBar(title: Text("test app"),),
          body: new HomeScreen(),
        ),
      ),
    );
  }
}

