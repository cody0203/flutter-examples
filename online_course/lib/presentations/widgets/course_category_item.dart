import 'package:flutter/material.dart';

import '../../domain/entities/course_category.dart';
import 'course_icon.dart';

class CourseCategoryItem extends StatelessWidget {
  final CourseCategory course;

  const CourseCategoryItem({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CourseIcon(icon: course.icon),
          SizedBox(height: 13),
          Text(
            course.name,
            style: Theme.of(context).textTheme.bodyText1!.merge(
                  TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
