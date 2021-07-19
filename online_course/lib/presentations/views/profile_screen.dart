import 'package:flutter/material.dart';

import '../widgets/course_categories.dart';
import '../widgets/profile_statistic.dart';
import '../widgets/progress_course_list.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        margin: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 83,
                height: 83,
              ),
            ),
            SizedBox(height: 19),
            Center(
              child: Text(
                'Luke Shaw'.toUpperCase(),
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 39),
            ProfileStatistic(),
            SizedBox(height: 39),
            Text(
              'MY COURSES',
              style: Theme.of(context).textTheme.headline3!.merge(
                    TextStyle(
                      letterSpacing: 1,
                    ),
                  ),
            ),
            SizedBox(height: 26),
            CourseCategories(),
            SizedBox(height: 39),
            Text(
              'PROGRESS COURSES',
              style: Theme.of(context).textTheme.headline3!.merge(
                    TextStyle(
                      letterSpacing: 1,
                    ),
                  ),
            ),
            SizedBox(height: 26),
            ProgressCourseList(),
          ],
        ),
      ),
    );
  }
}
