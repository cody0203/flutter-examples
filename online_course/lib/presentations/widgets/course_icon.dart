import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseIcon extends StatelessWidget {
  final String icon;

  const CourseIcon({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(13, 81, 96, 0.04),
            blurRadius: 20.0,
            spreadRadius: 0,
            offset: Offset(0, 8),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: SvgPicture.asset(
        icon,
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      ),
    );
  }
}
