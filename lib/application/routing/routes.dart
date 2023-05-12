import 'package:advicer/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = HomeScreen.id;
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreenWrapperProvider(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
