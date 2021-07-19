import 'package:flutter/material.dart';

import '../../domain/entities/course.dart';
import 'course_item.dart';

class MyCourseList extends StatelessWidget {
  final List<Course> courses;
  final String title;

  const MyCourseList({
    required this.courses,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 21),
        for (var i = 0; i < courses.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: i != courses.length ? 17 : 0,
            ),
            child: CourseItem(
              course: courses[i],
            ),
          ),
      ],
    );
  }
}
