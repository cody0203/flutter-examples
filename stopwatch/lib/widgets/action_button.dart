import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Color buttonBgColor;
  final Color textColor;
  final String textButton;
  final VoidCallback onPress;

  ActionButton({
    required this.buttonBgColor,
    required this.textColor,
    required this.textButton,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      width: 94,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: buttonBgColor,
        ),
        borderRadius: BorderRadius.circular(47),
      ),
      padding: const EdgeInsets.all(2),
      child: CupertinoButton(
        onPressed: onPress,
        padding: EdgeInsets.zero,
        child: Text(
          textButton,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
        color: buttonBgColor,
        borderRadius: BorderRadius.circular(47),
      ),
    );
  }
}
