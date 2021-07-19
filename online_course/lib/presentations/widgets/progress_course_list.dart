import 'package:flutter/material.dart';

import '../../data/progress_courses.dart';
import '../../domain/entities/progress_course.dart';
import 'progress_course_item.dart';

class ProgressCourseList extends StatelessWidget {
  final List<ProgressCourse> _progressCourses = progressCourses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var course in _progressCourses)
          ProgressCourseItem(
            course: course,
          ),
      ],
    );
  }
}
