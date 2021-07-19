import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarActionIcon extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  const AppBarActionIcon({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 28),
      child: GestureDetector(
        onTap: onTap,
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
