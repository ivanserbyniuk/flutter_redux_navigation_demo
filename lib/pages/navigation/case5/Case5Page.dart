import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_coffe_app2/redux/AppState.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case5/LoadingViewModel.dart';
import 'package:flutter_test_coffe_app2/utils/utils.dart';
import 'package:redux/redux.dart';

class Case5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LoadingViewModel>(
        converter: (Store store) => LoadingViewModel.create(store),
        builder: (BuildContext context, LoadingViewModel viewModel) => Scaffold(
            appBar: new AppBar(
              title: new Text("Use case 5"),
            ),
            body: new Center(child: _buildMainContent(context, viewModel))));
  }

  _buildMainContent(context, LoadingViewModel viewModel) {
    if (!viewModel.isLoaded) {
      _delayForLoading(viewModel);
      return Container(
        child: new CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation(Colors.red),
        ),
        height: 60.0,
        width: 60.0,
      );
    } else
      return Text("Data loaded");
  }

  Future _delayForLoading(LoadingViewModel viewModel) async {
    await new Future.delayed(new Duration(milliseconds: 3000), () {
      viewModel.loadFinish();
    });
  }
}

class ScreenB extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: new Text("Screen B"),
        ),
      );
}
