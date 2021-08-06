import 'package:flutter/material.dart';

class CategoryTitles extends StatelessWidget {
  const CategoryTitles({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          const Text('SHOW ALL'),
        ],
      ),
    );
  }
}
