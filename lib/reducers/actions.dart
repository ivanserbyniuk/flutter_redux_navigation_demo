import 'package:flutter_test_coffe_app2/AppState.dart';


class ChangeModeAction {
  SideBarMode index;
  ChangeModeAction(this.index);
}

class ChangeTabAction {
  int tabIndex;
  ChangeTabAction(this.tabIndex);
}

class LockAction {
  bool isLocked;
  LockAction(this.isLocked);
}

class LockedMessageAction {
  String lockedMessage;
  LockedMessageAction(this.lockedMessage);
}