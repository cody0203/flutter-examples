import 'package:flutter/material.dart';

class EngageFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 63),
      child: Column(
        children: <Widget>[
          Text(
            'We Engage',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 48),
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: -30,
                right: -30,
                child: Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(42.5),
                  ),
                ),
              ),
              Positioned(
                bottom: -30,
                left: -40,
                child: Transform.rotate(
                  angle: 6,
                  child: Image.asset(
                    'assets/images/square.png',
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                right: -30,
                child: Image.asset(
                  'assets/images/multiple_dot.png',
                  width: 104,
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image.asset(
                      'assets/images/engage_feature_utube.png',
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 14,
                        left: 19,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromRGBO(2, 2, 2, 0.26),
                            const Color.fromRGBO(0, 0, 0, 0.15),
                            const Color.fromRGBO(0, 0, 0, 0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Watch now: Talkspace#10',
                        style: Theme.of(context).textTheme.bodyText1!.merge(
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    width: 77,
                    height: 46,
                    top: MediaQuery.of(context).size.width * 0.38,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(211, 47, 47, 0.7),
                      ),
                      child: Image.asset(
                        'assets/images/white_triangle.png',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 90),
          Text(
            "We open dialogues on issues \n around starting a business and \n share our experts' knowledge to strengthen the entrepreneurial \n spirit within our community.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!,
          ),
        ],
      ),
    );
  }
}
