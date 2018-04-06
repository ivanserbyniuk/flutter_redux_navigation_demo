class AppState {
  final SideBarMode sideBarMode;
  final int tabIndex;
  final bool isLocked;
  final String lockedMessage;

  AppState({this.sideBarMode, this.tabIndex, this.isLocked, this.lockedMessage});

  factory AppState.initial() =>
      AppState(sideBarMode: SideBarMode.one, tabIndex: 0, isLocked: false, lockedMessage: "");
}

enum SideBarMode {
  one,
  two,
  three
}