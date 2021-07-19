import 'package:flutter/material.dart';

import '../../domain/entities/enroll_course.dart';
import 'custom_expansion_title.dart';

class EnrollCourseItem extends StatefulWidget {
  final CourseEnroll course;

  const EnrollCourseItem({
    required this.course,
  });

  @override
  _EnrollCourseItemState createState() => _EnrollCourseItemState();
}

class _EnrollCourseItemState extends State<EnrollCourseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.course.bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 7),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: CustomExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 19,
          ),
          childrenPadding: const EdgeInsets.only(
            top: 10,
            left: 19,
            bottom: 19,
          ),
          iconColor: Colors.white,
          trailing: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: Color.fromRGBO(22, 98, 115, 0.1),
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(right: 13),
                    alignment: Alignment.center,
                    child: Text(
                      widget.course.enrollCount.toString(),
                      style: Theme.of(context).textTheme.bodyText1!.merge(
                            TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          title: Expanded(
            child: Text(
              widget.course.title,
              style: Theme.of(context).textTheme.headline4!.merge(
                    TextStyle(
                      color: Colors.white,
                    ),
                  ),
            ),
          ),
          children: <Widget>[
            for (var i = 0; i < widget.course.courses.length; i++)
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Text(
                      '${i + 1}.',
                      style: Theme.of(context).textTheme.bodyText2!.merge(
                            TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    ),
                    SizedBox(width: 9),
                    Text(
                      '${widget.course.courses[i]}',
                      style: Theme.of(context).textTheme.bodyText2!.merge(
                            TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
