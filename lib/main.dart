import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/core/route/navigation_service.dart';
import 'package:flutter_animations/core/route/navigator_key.dart';
import 'package:flutter_animations/core/route/route_names.dart';
import 'package:flutter_animations/core/route/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteRegistry.root,
      navigatorKey: navigationKey,
      onGenerateRoute: RouterSetup.generateRoute,
    );
  }
}

// BouncingBall(title: 'Bouncing Ball')

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}
