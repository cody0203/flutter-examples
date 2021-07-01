import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String content;
  final VoidCallback onPress;
  final Color buttonBg;
  final Color overlayColor;

  AppButton({
    required this.content,
    required this.onPress,
    required this.buttonBg,
    required this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          content,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(overlayColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 8),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(buttonBg),
        ),
      ),
    );
  }
}
