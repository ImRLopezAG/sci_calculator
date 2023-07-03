import 'package:flutter/material.dart';
import 'package:sci_calculator/src/src.dart';

class PadButton extends StatelessWidget {
  final String text;
  final VoidCallback handleTap;
  final bool isEnabled;
  final double size;

  const PadButton({
    Key? key,
    required this.text,
    required this.handleTap,
    this.isEnabled = true,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerSize = MediaQuery.of(context).size.width / 5;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(containerSize / 2),
      ),
      child: Center(
        child: text == 'TRIG' || text == 'DEL' || text == 'C'
            ? IconButton(
                onPressed: handleTap,
                icon: Icon(
                  text == 'TRIG'
                      ? Icons.square_foot_rounded
                      : text == 'DEL'
                          ? Icons.keyboard_backspace_rounded
                          : Icons.refresh_rounded,
                  size: size == 18 ? 24 : 35,
                  color: AppTheme.primaryColor,
                ))
            : TextButton(
                onPressed: isEnabled ? handleTap : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    isEnabled ? Colors.grey[850] : Colors.grey[800],
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(24),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(containerSize / 2),
                    ),
                  ),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "RobotoMono",
                  ),
                ),
              ),
      ),
    );
  }
}
