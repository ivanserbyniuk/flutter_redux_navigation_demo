class AppState {
  final SideBarMode sideBarMode;

  AppState( this.sideBarMode);

  factory AppState.initial() => AppState(SideBarMode.one);
}

enum SideBarMode {
  one, two, three
}