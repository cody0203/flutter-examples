import 'package:flutter/material.dart';

import '../../domain/entities/progress_course.dart';
import 'course_icon.dart';

class ProgressCourseItem extends StatelessWidget {
  final ProgressCourse course;

  const ProgressCourseItem({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 7),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CourseIcon(
            icon: course.icon,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                course.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 6),
              Text(
                course.subTitle,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
