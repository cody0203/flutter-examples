import 'package:flutter/material.dart';

class CourseEnroll {
  final String title;
  final int enrollCount;
  final List<String> courses;
  final Color bgColor;

  const CourseEnroll({
    required this.title,
    required this.enrollCount,
    required this.courses,
    required this.bgColor,
  });
}
