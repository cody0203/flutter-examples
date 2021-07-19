import 'package:flutter/material.dart';

class EnrollCourseCollapseBlock extends StatelessWidget {
  final bool isOpen;
  final List<String> courses;

  const EnrollCourseCollapseBlock({
    required this.isOpen,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < courses.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              '${i + 1}. ${courses[i]}',
              style: Theme.of(context).textTheme.bodyText2!.merge(
                    TextStyle(
                      color: Colors.white,
                    ),
                  ),
            ),
          ),
      ],
    );
  }
}
