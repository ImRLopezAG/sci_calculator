import 'package:flutter/material.dart';
import 'package:sci_calculator/src/src.dart';

class KeyPad extends StatefulWidget {
  final TextEditingController controller;
  final Function(double) axisManager;
  final Function(String) setLastText;

  const KeyPad(
      {Key? key,
      required this.controller,
      required this.axisManager,
      required this.setLastText})
      : super(key: key);

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  final List<String> buttons = [
    "C",
    "^",
    "/",
    "DEL",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "TRIG",
    "0",
    ".",
    "=",
  ];
  final List<String> operators = ["+", "-", "x", "/", '^'];
  int axis = 4;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: buttons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axis,
      ),
      itemBuilder: (BuildContext context, int index) {
        return PadButton(
          text: buttons[index],
          handleTap: () => _handleButtonPress(buttons[index]),
          isEnabled: !_disableOperators(buttons[index]),
          size: axis == 4 ? 24 : 18,
        );
      },
    );
  }

  void _handleButtonPress(String text) {
    final currentText = widget.controller.text;
    if (text == "C") {
      widget.controller.clear();
    } else if (text == "DEL") {
      if (currentText.isNotEmpty) {
        widget.controller.text =
            currentText.substring(0, currentText.length - 1);
        setState(() {});
      }
    } else if (text == "=") {
      try {
        final result = Results.calculate(currentText);
        widget.controller.text = "$result";
        widget.setLastText(result.toString());
        setState(() {});
      } catch (e) {
        widget.controller.text = "Invalid Syntax Error";
        Future.delayed(
            const Duration(milliseconds: 500), () => widget.controller.clear());
        setState(() {});
      }
    } else if (text == "TRIG") {
      buttons.contains("SIN") ? _restore() : _addTrigonometric();
      widget.axisManager(axis == 4 ? 0.6 : 0.47);
      setState(() {
        buttons;
      });
    } else {
      widget.controller.text += text;
      setState(() {});
    }
  }

  bool _disableOperators(String opt) {
    if (operators.contains(opt)) {
      if (widget.controller.text.isEmpty) {
        return true;
      } else {
        final lastChar =
            widget.controller.text[widget.controller.text.length - 1];
        return operators.contains(lastChar);
      }
    }
    return false;
  }

  void _restore() {
    axis = 4;
    buttons.clear();
    buttons.addAll([
      "C",
      "^",
      "/",
      "DEL",
      "9",
      "8",
      "7",
      "x",
      "6",
      "5",
      "4",
      "-",
      "3",
      "2",
      "1",
      "+",
      "TRIG",
      "0",
      ".",
      "=",
    ]);
  }

  void _addTrigonometric() {
    axis = 5;
    buttons.clear();
    buttons.addAll([
      "C",
      "^",
      "/",
      "DEL",
      "SIN",
      "9",
      "8",
      "7",
      "x",
      "COS",
      "6",
      "5",
      "4",
      "-",
      "TAN",
      "3",
      "2",
      "1",
      "+",
      "LN",
      "TRIG",
      "0",
      ".",
      "=",
      "√",
    ]);
  }
}
