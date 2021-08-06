import 'package:flutter/material.dart';

class CustomSlidePageTransition<T> extends PageRouteBuilder<T> {
  CustomSlidePageTransition(
    this.widget,
    this.settings,
  ) : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const Offset begin = Offset(0.0, 1.0);
            const Offset end = Offset.zero;
            const Curve curve = Curves.bounceInOut;

            final Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);
            final CurvedAnimation curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          settings: settings,
        );

  final Widget widget;
  final RouteSettings settings;
}
