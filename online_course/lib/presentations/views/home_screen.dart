import 'package:flutter/material.dart';

import '../widgets/course_categories.dart';
import '../widgets/enroll_course_list.dart';
import '../widgets/search_input.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Howdy, ',
              style: Theme.of(context).textTheme.bodyText1!.merge(
                    TextStyle(
                      fontSize: 20,
                      height: 2,
                      color: Color(0xffC4C4C4),
                    ),
                  ),
            ),
            Text(
              'Luke Shaw',
              style: Theme.of(context).textTheme.headline2!.merge(
                    TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 28,
                      height: 1.429,
                    ),
                  ),
            ),
            SizedBox(height: 32),
            SearchInput(),
            SizedBox(height: 19),
            Text(
              'Course',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 19),
            CourseCategories(),
            SizedBox(height: 36),
            Text(
              'Enrolled course',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 19),
            EnrollCourseList()
          ],
        ),
      ),
    );
  }
}
