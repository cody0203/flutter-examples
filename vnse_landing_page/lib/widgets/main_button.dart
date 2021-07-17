import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;

  const MainButton({
    required this.child,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 229,
      height: 40,
      child: ElevatedButton(
        onPressed: onPress,
        child: child,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).errorColor,
          ),
        ),
      ),
    );
  }
}
