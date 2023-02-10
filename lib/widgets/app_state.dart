import 'package:flutter/material.dart';

class AppState {
  int numPlayers;
  AppState(this.numPlayers);
}

/// It's a widget that provides a value to its descendants
class AppStateScope extends InheritedWidget {
  final AppState data;

  const AppStateScope(this.data, {Key? key, required Widget child})
      : super(key: key, child: child);

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) {
    return data != oldWidget.data;
  }
}

/// `AppStateWidget` is a `StatefulWidget` that provides a `State` object to its
/// descendants
class AppStateWidget extends StatefulWidget {
  final Widget child;

  const AppStateWidget({required this.child, Key? key}) : super(key: key);

  static AppStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<AppStateWidgetState>()!;
  }

  @override
  AppStateWidgetState createState() => AppStateWidgetState();
}

/// `AppStateWidget` is a `StatefulWidget` that wraps the `AppStateScope` widget,
/// which is a `StatelessWidget`
class AppStateWidgetState extends State<AppStateWidget> {
  final AppState _data = AppState(0);

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      _data,
      child: widget.child,
    );
  }

  AppState get() => _data;
}
