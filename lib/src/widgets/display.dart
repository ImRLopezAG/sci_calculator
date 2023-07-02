import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final ValueNotifier<String> textNotifier;

  const Display({Key? key, required this.textNotifier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: ValueListenableBuilder<String>(
          valueListenable: textNotifier,
          builder: (BuildContext context, String value, Widget? child) {
            return Text(
              value,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
