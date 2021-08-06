import 'package:flutter/material.dart';

class ProductWeight extends StatelessWidget {
  const ProductWeight({
    Key? key,
    required this.weight,
  }) : super(key: key);

  final int weight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'weight',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: 10,
                ),
          ),
          TextSpan(
            text: ' ${weight.toString()}g',
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  fontSize: 10,
                  height: 1.833,
                ),
          )
        ],
      ),
    );
  }
}
