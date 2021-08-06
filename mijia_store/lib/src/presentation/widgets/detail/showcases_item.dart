import 'package:flutter/material.dart';
import 'package:mijia_store/src/presentation/widgets/shared/product_layer_blur.dart';

class ShowcasesItem extends StatelessWidget {
  const ShowcasesItem({
    Key? key,
    required this.imageAsset,
    required this.onChangeImage,
  }) : super(key: key);
  final String imageAsset;
  final VoidCallback onChangeImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChangeImage,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.height < 780
                ? MediaQuery.of(context).size.width * 0.15
                : MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height < 780
                ? MediaQuery.of(context).size.width * 0.15
                : MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0.0, 8.0),
                    color: Color(0xFFF1F4F9),
                  )
                ]),
            child: Image.asset(
              imageAsset,
              fit: BoxFit.contain,
            ),
          ),
          ProductLayerBlur(
            width: MediaQuery.of(context).size.height < 780
                ? MediaQuery.of(context).size.width * 0.15
                : MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.02,
            top: 0,
          ),
        ],
      ),
    );
  }
}
