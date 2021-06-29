import 'package:flutter/material.dart';

class HelloWorld1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello World!'.toUpperCase(),
        style: Theme.of(context).textTheme.headline1?.merge(
              TextStyle(
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
