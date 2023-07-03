import 'package:flutter/material.dart';

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
          children: [
            DisplayTexts(notifier: lastNotifier, isLast: true),
            DisplayTexts(notifier: textNotifier, isLast: false),
          ],
        ),
      ),
    );
  }
}

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
