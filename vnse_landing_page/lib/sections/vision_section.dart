import 'package:flutter/material.dart';
import 'package:vnse_landing_page/widgets/vision_carousel.dart';

class VisionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xffF7F7F7),
      margin: const EdgeInsets.only(bottom: 215),
      child: Column(
        children: <Widget>[
          Text(
            'Our Vision',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 58),
          VisionCarousel(),
        ],
      ),
    );
  }
}
