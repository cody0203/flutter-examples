import 'package:flutter/material.dart';

class ProductPricePerKg extends StatelessWidget {
  const ProductPricePerKg({
    Key? key,
    required this.pricePerKg,
    this.priceFontSize = 12,
    this.kgLabelFontSize = 10,
  }) : super(key: key);
  final double pricePerKg;
  final double priceFontSize;
  final double kgLabelFontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: '\$${pricePerKg.toInt()}',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: priceFontSize,
                ),
          ),
          TextSpan(
            text: ' /kg',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontSize: kgLabelFontSize,
                ),
          )
        ],
      ),
    );
  }
}
