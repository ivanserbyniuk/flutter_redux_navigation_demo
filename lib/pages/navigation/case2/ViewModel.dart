import 'package:flutter_test_coffe_app2/AppState.dart';
import 'package:flutter_test_coffe_app2/reducers/actions.dart';
import 'package:redux/redux.dart';

class TabViewModel{
  int tabIndex;
  Function selectTab;

  TabViewModel(this.tabIndex, this.selectTab);

  factory TabViewModel.create(Store<AppState> store) {
    return TabViewModel(store.state.tabIndex, (int tabIndex) {
      print(tabIndex);
      store.dispatch(new ChangeTabAction(tabIndex));
    });
  }
}

