import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class VisionCarouselItem extends StatelessWidget {
  final String year;

  const VisionCarouselItem({
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 10,
            child: Transform.rotate(
              angle: 1.3,
              child: Image.asset(
                'assets/images/square.png',
                width: 63,
              ),
            ),
          ),
          DottedBorder(
            color: Theme.of(context).errorColor,
            strokeWidth: 1,
            dashPattern: [8, 5, 2, 3],
            borderType: BorderType.RRect,
            radius: const Radius.circular(16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width * 0.88,
              ),
              padding: const EdgeInsets.only(
                top: 30,
                left: 15,
                right: 16,
                bottom: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    year,
                    style: Theme.of(context).textTheme.bodyText1!.merge(
                          TextStyle(
                            color: Theme.of(context).errorColor,
                            fontSize: 24,
                          ),
                        ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Viet Startup Europe is founded',
                    style: Theme.of(context).textTheme.headline1!.merge(
                          TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            letterSpacing: 1,
                          ),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        "We're striving to become a trusted \n and sustainable startup ecosystem \n for Vietnam-connected entrepreneurs \n in the European continent",
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                      Positioned(
                        top: -15,
                        left: MediaQuery.of(context).size.width * 0.23,
                        child: Image.asset('assets/images/flag.png'),
                      ),
                    ],
                  ),
                  Text(
                    'Learn more about us here.',
                    style: Theme.of(context).textTheme.bodyText1!.merge(
                          TextStyle(
                            color: Theme.of(context).errorColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Theme.of(context).primaryColor,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                'assets/images/triangle.png',
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
