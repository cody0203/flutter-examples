import 'package:flutter/material.dart';

import 'showcases_item.dart';

class ProductShowcases extends StatelessWidget {
  const ProductShowcases({
    Key? key,
    required this.imageAssets,
    required this.changeRepresentImage,
  }) : super(key: key);
  final List<String> imageAssets;
  final Function changeRepresentImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Showcases',
          style: Theme.of(context).textTheme.headline3?.copyWith(
                fontSize: 14,
                height: 1.14,
                color: const Color(0xFF606368),
              ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height < 780
                ? MediaQuery.of(context).size.width * 0.02
                : MediaQuery.of(context).size.width * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            for (int i = 0; i < imageAssets.length; i++)
              ShowcasesItem(
                imageAsset: imageAssets[i],
                onChangeImage: () {
                  changeRepresentImage(i);
                },
              ),
          ],
        )
      ],
    );
  }
}
