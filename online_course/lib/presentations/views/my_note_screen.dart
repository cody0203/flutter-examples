import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyNoteScreen extends StatelessWidget {
  static const String routeName = '/my-note';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/under-construction.svg',
            width: 200,
          ),
          Text(
            'Coming soon!',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
