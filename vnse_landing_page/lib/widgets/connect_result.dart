import 'package:flutter/material.dart';

class ConnectResult extends StatelessWidget {
  final String count;
  final String description;

  const ConnectResult({
    required this.count,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          count,
          style: Theme.of(context).textTheme.headline1!.merge(
                TextStyle(
                  fontSize: 72,
                  color: Colors.white,
                ),
              ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1!.merge(
                TextStyle(color: Colors.white),
              ),
        ),
      ],
    );
  }
}
