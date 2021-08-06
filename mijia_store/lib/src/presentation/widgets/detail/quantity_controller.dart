import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../shared/main_button.dart';

class QuantityController extends StatelessWidget {
  const QuantityController({
    Key? key,
    required this.amount,
    required this.changeAmount,
  }) : super(key: key);
  final int amount;
  final Function changeAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MainButton(
          height: 36,
          width: 36,
          onPressed: () {
            changeAmount(amount - 1);
          },
          buttonColor: Colors.white,
          containerDecoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0.0, 20.0),
                blurRadius: 120,
                color: const Color(0xFF283E67).withOpacity(0.52),
              ),
            ],
          ),
          child: const Icon(
            Icons.remove,
            color: Color(0xFF1B110A),
            size: 16,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          width: MediaQuery.of(context).size.height < 780
              ? MediaQuery.of(context).size.width * 0.06
              : MediaQuery.of(context).size.width * 0.07,
          alignment: Alignment.center,
          child: Text(
            amount.toString(),
            style: Theme.of(context).textTheme.headline2?.copyWith(
              color: const Color(0xFF1B1B1B),
              height: 1.17,
              fontFeatures: <FontFeature>[
                const FontFeature.tabularFigures(),
              ],
            ),
          ),
        ),
        MainButton(
          height: 36,
          width: 36,
          onPressed: () {
            changeAmount(amount + 1);
          },
          buttonColor: Colors.white,
          containerDecoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: const Offset(0.0, 20.0),
                blurRadius: 120,
                color: const Color(0xFF283E67).withOpacity(0.52),
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Color(0xFF1B110A),
            size: 16,
          ),
        ),
      ],
    );
  }
}
