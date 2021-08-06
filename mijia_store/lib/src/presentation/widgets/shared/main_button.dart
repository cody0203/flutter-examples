import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.child,
    this.buttonColor,
    this.containerDecoration,
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Widget child;
  final BoxDecoration? containerDecoration;

  @override
  Widget build(BuildContext context) {
    return _buildButton(context);
  }

  Widget _buildButton(BuildContext ctx) {
    return Container(
      constraints: BoxConstraints.tightFor(
        width: width,
        height: height,
      ),
      decoration: containerDecoration,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            buttonColor ?? Theme.of(ctx).buttonColor,
          ),
          elevation: MaterialStateProperty.all<double>(0.0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.all(0),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
