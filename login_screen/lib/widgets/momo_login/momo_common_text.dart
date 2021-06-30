import 'package:flutter/material.dart';

class MomoCommonText extends StatelessWidget {
  final String data;

  MomoCommonText(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data.toUpperCase(),
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
