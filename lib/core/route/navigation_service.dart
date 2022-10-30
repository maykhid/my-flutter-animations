import 'package:flutter/material.dart';
import 'package:flutter_animations/core/route/navigator_key.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = navigationKey;

  pop() {
    return _navigationKey.currentState!.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacementTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil<T extends dynamic>(String newRoute) {
    return _navigationKey.currentState!
        .pushNamedAndRemoveUntil(newRoute, (Route<dynamic> route) => false);
  }
}
