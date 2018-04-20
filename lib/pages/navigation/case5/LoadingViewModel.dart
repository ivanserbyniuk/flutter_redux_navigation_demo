import 'package:flutter_test_coffe_app2/redux/AppState.dart';
import 'package:flutter_test_coffe_app2/redux/actions.dart';
import 'package:redux/redux.dart';

class LoadingViewModel {
  bool isLoaded;
  Function loadFinish;
  LoadingViewModel(this.isLoaded, this.loadFinish);

  factory LoadingViewModel.create(Store<AppState> store) {
    return new LoadingViewModel(store.state.isContentLoaded,
          () => store.dispatch(new LoadFinishAction()),);
  }
}