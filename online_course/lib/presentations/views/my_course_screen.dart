import 'package:flutter/material.dart';

import '../../data/my_course.dart';
import '../../domain/entities/course.dart';
import '../widgets/my_course_list.dart';
import '../widgets/search_input.dart';

class MyCourseScreen extends StatelessWidget {
  static const String routeName = '/my-course';
  final List<Course> _allCourses = allCourses;
  final List<Course> _completedCourses = completedCourses;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            SearchInput(),
            SizedBox(height: 23),
            MyCourseList(
              courses: _allCourses,
              title: 'All courses',
            ),
            SizedBox(height: 23),
            MyCourseList(
              courses: _completedCourses,
              title: 'Completed courses',
            ),
          ],
        ),
      ),
    );
  }
}
