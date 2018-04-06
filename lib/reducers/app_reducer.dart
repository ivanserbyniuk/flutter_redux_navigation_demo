import 'package:flutter_test_coffe_app2/AppState.dart';
import 'package:flutter_test_coffe_app2/reducers/actions.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, action) =>
    AppState(
        sideBarMode: listDrawerReducer(state.sideBarMode, action),
        tabIndex: listTabReducer(state.tabIndex, action),
        isLocked: lockReducer(state.isLocked, action),
        lockedMessage: lockedMessageReducer(state.lockedMessage, action)
    );

final Reducer<int> listTabReducer = combineReducers<int>([
  TypedReducer<int, ChangeTabAction>(_activeTabReducer),
]);

final Reducer<SideBarMode> listDrawerReducer = combineReducers<SideBarMode>([
  TypedReducer<SideBarMode, ChangeModeAction>(_reduceDrawerMenu),
]);

final Reducer<bool> lockReducer = combineReducers<bool>([
  TypedReducer<bool, LockAction>(_reduceLock),
]);

final Reducer<String> lockedMessageReducer = combineReducers<String>([
  TypedReducer<String, LockedMessageAction>(_reduceLockedMessage),
]);


int _activeTabReducer(int activeTab, ChangeTabAction action) => action.tabIndex;

SideBarMode _reduceDrawerMenu(SideBarMode sideBarMode, ChangeModeAction action) => action.index;

bool _reduceLock(bool lock, LockAction action) => action.isLocked;

String _reduceLockedMessage(String lockedMess, LockedMessageAction action) => action.lockedMessage;


