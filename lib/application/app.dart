import 'package:advicer/application/routing/routes.dart';
import 'package:advicer/application/theme_provider/theme.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.themeProvider}) : super(key: key);
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: Constants.kColorScheme,
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: Constants.kColorDarkScheme,
      ),
      themeMode: themeProvider.isDark ? ThemeMode.light : ThemeMode.dark,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.homeRoute,
    );
  }
}
