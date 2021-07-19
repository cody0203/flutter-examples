import 'package:flutter/material.dart';

import '../views/home_screen.dart';
import 'main_button.dart';

class SocialLoginMethods extends StatelessWidget {
  void _goToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Sign in with another account',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 21),
        MainButton.outline(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/google_icon.png',
                width: 20,
              ),
              SizedBox(width: 12),
              Text(
                'Google',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          onPressed: () {
            _goToHomePage(context);
          },
        ),
        SizedBox(height: 20),
        MainButton.outline(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/facebook_icon.png',
                width: 26,
              ),
              SizedBox(width: 12),
              Text(
                'Facebook',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          onPressed: () {
            _goToHomePage(context);
          },
        ),
      ],
    );
  }
}
