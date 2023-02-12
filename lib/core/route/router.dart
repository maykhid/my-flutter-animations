import 'package:flutter/material.dart';
import 'package:flutter_animations/app/screens/box_rotates_X_Y_Z_axis.dart';
import 'package:flutter_animations/app/screens/multi_bouncing_balls.dart';
// import 'package:flutter_animations/app/screens/running_late.dart';
import 'package:flutter_animations/core/route/route_names.dart';

import '../../app/screens/bouncing_ball.dart';
import '../../app/screens/home.dart';

class RouterSetup {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteRegistry.root:
        return MaterialPageRoute(builder: (_) => const Home());
      case RouteRegistry.bouncingBall:
        return MaterialPageRoute(
            builder: (_) => const BouncingBall(title: 'Bouncing Ball'));
      case RouteRegistry.multipleBouncingBalls:
        return MaterialPageRoute(builder: (_) => const MultiBouncingBalls());
      case RouteRegistry.rotateBoxAroundXYZAxis:
        return MaterialPageRoute(builder: (_) => const RotateBoxAroundYAxis());
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
