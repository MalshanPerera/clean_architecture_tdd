import 'package:clean_architecture_tdd/core/error/exception.dart';
import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState;
import '../widgets/error_toast.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  void pop() {
    _navigatorKey.currentState!.pop();
  }

  Future<dynamic> pushReplacement(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: args);
  }

  void showError(GeneralException exception) {
    final context = _navigatorKey.currentState!.overlay!.context;
    final ErrorToast handler = ErrorToast();
    handler.showError(context, exception);
  }

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
