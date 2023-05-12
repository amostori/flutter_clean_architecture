import 'package:advicer/application/theme_provider/theme.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, required this.themeProvider}) : super(key: key);
  final ThemeProvider themeProvider;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Advice App'),
      actions: <Widget>[
        Switch(
          value: themeProvider.isDark,
          onChanged: (_) {
            themeProvider.toggleTheme();
          },
        )
      ],
    );
  }
}

