import 'package:flutter/material.dart';

class MainButton extends ElevatedButton {
  const MainButton({
    required child,
    required VoidCallback onPressed,
  }) : super(child: child, onPressed: onPressed);

  factory MainButton.outline({
    required child,
    required VoidCallback onPressed,
  }) = _MainButtonOutlined;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final styles = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        Theme.of(context).buttonTheme.padding,
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      elevation: MaterialStateProperty.all<double>(0),
      backgroundColor: MaterialStateProperty.all<Color>(
        Theme.of(context).primaryColor,
      ),
    );
    return super.defaultStyleOf(context).copyWith(
          padding: styles.padding,
          shape: styles.shape,
          elevation: styles.elevation,
          backgroundColor: styles.backgroundColor,
        );
  }
}

class _MainButtonOutlined extends MainButton {
  _MainButtonOutlined({
    required child,
    required VoidCallback onPressed,
  }) : super(
          onPressed: onPressed,
          child: _MainButtonOutlinedChild(
            child: child,
            onPressed: onPressed,
          ),
        );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final styles = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      side: MaterialStateProperty.all(
        BorderSide(
          width: 1,
          color: Color(0xffE9E9E9),
        ),
      ),
    );
    return super.defaultStyleOf(context).copyWith(
          backgroundColor: styles.backgroundColor,
          side: styles.side,
        );
  }
}

class _MainButtonOutlinedChild extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const _MainButtonOutlinedChild({
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
