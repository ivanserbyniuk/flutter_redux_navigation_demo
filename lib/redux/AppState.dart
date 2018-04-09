class AppState {
  final SideBarMode sideBarMode;
  final int tabIndex;
  final bool isLocked;
  final String lockedMessage;
  final bool isContentLoaded;

  AppState({this.sideBarMode, this.tabIndex, this.isLocked,
    this.lockedMessage, this.isContentLoaded});

  factory AppState.initial() =>
      AppState(sideBarMode: SideBarMode.first,
          tabIndex: 0,
          isLocked: false,
          lockedMessage: "",
          isContentLoaded: false);
}

enum SideBarMode {
  first,
  second,
  third
}