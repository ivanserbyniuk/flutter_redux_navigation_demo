
import 'package:flutter_test_coffe_app2/AppState.dart';
import 'package:flutter_test_coffe_app2/pages/navigation/case4/Case4Page.dart';

AppState appReducer(AppState state, action) => AppState(reduceTabIndex(state.sideBarMode, action));


SideBarMode reduceTabIndex(SideBarMode sideBarMode, ChangeModeAction action) => action.index;

