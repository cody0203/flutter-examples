import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'vision_carousel_item.dart';

class VisionCarousel extends StatefulWidget {
  @override
  _VisionCarouselState createState() => _VisionCarouselState();
}

class _VisionCarouselState extends State<VisionCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  final List visionList = [
    '2018',
    '2019',
    '2020',
    '2021',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              initialPage: 0,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              height: MediaQuery.of(context).size.width,
              onPageChanged: (index, _) {
                setState(() {
                  _current = index;
                });
              }),
          items: [
            for (var i in visionList)
              VisionCarouselItem(
                year: i,
              ),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var i = 0; i < visionList.length; i++)
              GestureDetector(
                onTap: () => _controller.animateToPage(i),
                child: Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(right: 4, left: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      width: 3,
                      color: i == _current
                          ? Color(0xff24BCD4)
                          : Colors.transparent,
                    ),
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}
