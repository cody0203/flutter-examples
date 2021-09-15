import 'package:flutter/material.dart';

class TrailingTypes extends StatelessWidget {
  const TrailingTypes({
    Key? key,
    required this.imagesAsset,
  }) : super(key: key);
  final List<String> imagesAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          for (String image in imagesAsset)
            SizedBox(
              width: 50,
              height: 50,
              child: FadeInImage(
                image: AssetImage(
                  image,
                ),
                placeholder:
                    const AssetImage('assets/images/types/unknown.png'),
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
