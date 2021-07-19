import 'package:flutter/material.dart';

import '../domain/entities/enroll_course.dart';

List<CourseEnroll> enrolledCourses = [
  CourseEnroll(
    title: 'Enrolled course',
    enrollCount: 3,
    courses: [
      'UI / UX For Landing Pages.',
      'Copywritter',
      'Product branding class',
    ],
    bgColor: Color(0xffFF94CC),
  ),
  CourseEnroll(
    title: 'Active course',
    enrollCount: 4,
    courses: [
      'Copywritting class',
      'Video editing class',
      'Interior design',
      'Microsoft Excel',
    ],
    bgColor: Color(0xffFFC074),
  ),
  CourseEnroll(
    title: 'Completed course',
    enrollCount: 6,
    courses: [
      'Translator',
      'ReactJs',
      'HTML5',
      'CSS3',
      'JavaScript',
      'Flutter',
    ],
    bgColor: Color(0xff39A2DB),
  ),
];
