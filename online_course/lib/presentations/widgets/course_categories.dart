import 'package:flutter/material.dart';

import '../../data/course_category.dart';
import '../../domain/entities/course_category.dart';
import 'course_category_item.dart';

class CourseCategories extends StatelessWidget {
  final List<CourseCategory> _courses = categories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 7),
      child: Row(
        children: <Widget>[
          for (var course in _courses) CourseCategoryItem(course: course),
        ],
      ),
    );
  }
}
