import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  static String emptyAdvice = 'What should i do with an empty advice?!';

  final String advice;

  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Center(
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeData.colorScheme.tertiary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Text(advice),
          ),
        ),
      ),
    );
  }
}
