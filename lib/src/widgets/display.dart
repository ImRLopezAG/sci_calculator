import 'package:flutter/material.dart';
import 'package:sci_calculator/src/src.dart';

class Display extends StatelessWidget {
  final ValueNotifier<String> textNotifier;
  final ValueNotifier<String> lastNotifier;

  const Display(
      {Key? key, required this.textNotifier, required this.lastNotifier})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DisplayTexts(notifier: lastNotifier, isLast: true),
            DisplayTexts(notifier: textNotifier, isLast: false),
          ],
        ),
      ),
    );
  }
}
