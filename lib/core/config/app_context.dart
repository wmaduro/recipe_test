import 'package:flutter/material.dart';

final appContext = AppContext._();

class AppContext {
  AppContext._();
  BuildContext? _currentContext;
  BuildContext? get currentContext {
    return _currentContext;
  }

  set currentContextx(BuildContext? context) {
    this._currentContext = context;
  }
}
