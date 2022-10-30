import 'package:flutter/material.dart';

/// Note to Future me: Before you ask, I only just made the navigationKey global to avoid using dependency injection
/// This way I can call this key wherever I need it, by just calling [navigationKey]
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();