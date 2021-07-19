import 'package:flutter/material.dart';

import '../../data/enrolled_courses.dart';
import '../../domain/entities/enroll_course.dart';
import 'enroll_course_item.dart';

class EnrollCourseList extends StatelessWidget {
  final List<CourseEnroll> enrollCourseList = enrolledCourses;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var course in enrollCourseList) EnrollCourseItem(course: course),
      ],
    );
  }
}
