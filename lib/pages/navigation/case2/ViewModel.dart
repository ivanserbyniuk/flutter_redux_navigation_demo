import 'package:flutter_test_coffe_app2/redux/AppState.dart';
import 'package:flutter_test_coffe_app2/redux/actions.dart';
import 'package:redux/redux.dart';

class TabViewModel{
  final int tabIndex;
  final Function selectTab;

  TabViewModel(this.tabIndex, this.selectTab);

  factory TabViewModel.create(Store<AppState> store) {
    return TabViewModel(store.state.tabIndex, (int tabIndex) {
      store.dispatch(new ChangeTabAction(tabIndex));
    });
  }
}

