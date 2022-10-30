import 'package:flutter/material.dart';

import '../../core/route/navigation_service.dart';
import '../../core/route/route_names.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _navigationKey,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Bouncing Ball'),
            onTap: () =>
                NavigationService().navigateTo(RouteRegistry.bouncingBall),
          ),
        ],
      ),
    );
  }
}

