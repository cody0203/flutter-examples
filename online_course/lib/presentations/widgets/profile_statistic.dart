import 'package:flutter/material.dart';

class ProfileStatistic extends StatelessWidget {
  final List<Map<String, dynamic>> _data = [
    {
      'title': 'Courses',
      'data': 15,
    },
    {
      'title': 'Connection',
      'data': 45,
    },
    {
      'title': 'Lesson',
      'data': 56,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        for (var i = 0; i < _data.length; i++) ...[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  _data[i]['data'].toString(),
                  style: Theme.of(context).textTheme.headline2!.merge(
                        TextStyle(fontSize: 18),
                      ),
                ),
                SizedBox(height: 10),
                Text(
                  _data[i]['title'],
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .merge(TextStyle(color: Color.fromRGBO(0, 0, 0, 0.25))),
                ),
              ],
            ),
          ),
          if (i < _data.length - 1)
            Container(
              width: 1,
              height: 23,
              color: Color(
                0xffDFDFDF,
              ),
            ),
        ]
      ],
    );
  }
}
