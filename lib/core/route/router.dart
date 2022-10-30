import 'package:flutter/material.dart';
import 'package:flutter_animations/core/route/route_names.dart';
import 'package:flutter_animations/main.dart';

class RouterSetup {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteRegistry.root:
        return MaterialPageRoute(builder: (_) => const Home(),);
        case RouteRegistry.bouncingBall:
        return MaterialPageRoute(builder: (_) => const BouncingBall(title: 'Bouncing Ball'));
      default:
        return MaterialPageRoute(builder: (_) => const Home(),);
    }
  }
}