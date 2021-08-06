import 'package:flutter/material.dart';

class PageBuilder extends Page {
  const PageBuilder({
    required this.page,
    required ValueKey<String> key,
  }) : super(key: key);

  final Widget page;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return page;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        const Offset begin = Offset(0.0, 1.0);
        const Offset end = Offset.zero;
        const Curve curve = Curves.ease;

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
    );
  }
}
