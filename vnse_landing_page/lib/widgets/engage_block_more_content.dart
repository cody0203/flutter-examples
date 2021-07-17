import 'package:flutter/material.dart';

import '../entities/engage.dart';

class EngageBlockMoreContent extends StatelessWidget {
  final String title;
  final List<Engage> data;

  const EngageBlockMoreContent({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 16),
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: EdgeInsets.only(
              bottom: (i == data.length - 1 ? 0 : 16),
            ),
            child: Row(
              children: <Widget>[
                Image.asset(
                  data[i].thumbnail,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.45 - 30,
                ),
                SizedBox(width: 19),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data[i].title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 9),
                      Text(
                        data[i].publishedAt,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
