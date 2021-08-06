import 'package:flutter/material.dart';

class ProductLayerBlur extends StatelessWidget {
  const ProductLayerBlur({
    Key? key,
    required this.width,
    this.height = 35,
    this.top = 11,
  }) : super(key: key);
  final double width;
  final double? height;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
