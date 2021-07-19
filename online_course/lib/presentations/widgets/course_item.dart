import 'package:flutter/material.dart';

import '../../domain/entities/course.dart';

class CourseItem extends StatelessWidget {
  final Course course;

  const CourseItem({
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            course.thumbnail,
            width: 77,
            height: 77,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 25),
        Expanded(
          child: SizedBox(
            height: 77,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    course.rating,
                    (index) => Icon(
                      Icons.star,
                      color: Color(0xffFFC947),
                      size: 16,
                    ),
                  ),
                ),
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headline4!.merge(
                        TextStyle(
                          color: Colors.black,
                          height: 1.21,
                          fontSize: 17,
                        ),
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(18, 213, 84, 0.3),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        course.progress,
                        style: Theme.of(context).textTheme.headline4!.merge(
                              TextStyle(
                                color: Color(0xff039708),
                                fontSize: 11,
                              ),
                            ),
                      ),
                    ),
                    Text(
                      '${course.totalLesson} Lesson',
                      style: Theme.of(context).textTheme.headline4!.merge(
                            TextStyle(
                              color: Color(0xffC8C8C8),
                              fontSize: 14,
                            ),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
