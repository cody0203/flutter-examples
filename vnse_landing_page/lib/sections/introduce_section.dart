import 'package:flutter/material.dart';

import '../widgets/main_button.dart';

class IntroduceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 93, bottom: 115),
      color: Color(0xffF7F7F7),
      child: Column(
        children: <Widget>[
          Text(
            'Vietnamese',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/triangle.png', width: 32),
              SizedBox(width: 10),
              Image.asset('assets/images/triangle.png', width: 32),
              SizedBox(width: 10),
              Text(
                'Startup',
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Network',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(width: 17),
              Image.asset('assets/images/circle.png'),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/square.png',
                width: 42,
              ),
              SizedBox(width: 11),
              Text(
                'in Europe',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            'We are VNSE',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 56,
              right: 41,
            ),
            child: Text(
              "Welcome to the official website of \n Vietnam Startup Network in Europe! \n We're the first empowerment platform for Vietnamese entrepreneurs across Europe.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 110),
          MainButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/triangle.png',
                  width: 18,
                  height: 18,
                ),
                SizedBox(width: 8),
                Text('What we do'),
              ],
            ),
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
