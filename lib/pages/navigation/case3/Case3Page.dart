import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test_coffe_app2/redux/AppState.dart';
import 'package:flutter_test_coffe_app2/redux/actions.dart';
import 'package:redux/redux.dart';


class Case3Page extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, LockViewModel>(
        converter: (Store store) => LockViewModel.create(store),
        builder: (BuildContext context, LockViewModel viewModel) => _buildMainContent(viewModel)
    );
  }

  _buildMainContent(LockViewModel viewModel) {
    if (viewModel.isLocked) {
      return Container(
        color: Colors.blue[800],
        child: Center(child:
        FloatingActionButton(
          onPressed: () => viewModel.lock(false),
          child: Icon(Icons.lock_open),
          backgroundColor: Colors.red,),),);
    }
    else {
      _controller.text = viewModel.lockedMessage;
      return new Scaffold(
        appBar: AppBar(title: Text("Use case 3"),
          actions: <Widget>[
            IconButton(icon: new Icon(Icons.lock_open, color: Colors.red,),
                onPressed: () => viewModel.lock(true)),
          ],),
        body: new Container(padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: new Center(
              child: TextField(
                controller: _controller,
                onChanged: (text) => viewModel.saveMessage(text),
                decoration: InputDecoration(hintText: 'Type something',),
              ),
           )),);
    }
  }
}

class LockViewModel {
  bool isLocked;
  String lockedMessage;
  Function lock;
  Function saveMessage;

  LockViewModel(this.isLocked, this.lockedMessage, this.lock, this.saveMessage);

  factory LockViewModel.create(Store<AppState> store) {
    return LockViewModel(store.state.isLocked, store.state.lockedMessage,
            (bool isLocked) => store.dispatch(new LockAction(isLocked)),
            (String lockedMessage) => store.dispatch(new LockedMessageAction(lockedMessage)));
  }
}




