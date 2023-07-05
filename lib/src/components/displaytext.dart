import 'package:flutter/material.dart';

class DisplayTexts extends StatelessWidget {
  const DisplayTexts({super.key, required this.notifier, required this.isLast});

  final ValueNotifier<String> notifier;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: notifier,
      builder: (BuildContext context, String value, Widget? child) {
        return Text(
          value,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: isLast ? Colors.grey : Colors.white,
          ),
        );
      },
    );
  }
}
