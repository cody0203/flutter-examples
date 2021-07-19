import 'package:flutter/material.dart';

import '../widgets/login_form.dart';
import '../widgets/social_login_methods.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Container(
            padding: const EdgeInsets.only(
              top: 8,
              right: 8,
              bottom: 8,
              left: 15,
            ),
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(16.5),
            ),
            child: Center(
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'INA',
                      style: Theme.of(context).textTheme.headline1!.merge(
                            TextStyle(
                              fontSize: 15,
                              height: 1.21,
                            ),
                          ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 28,
            right: 28,
            bottom: 56,
            top: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login to your \naccount.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 21),
              Text(
                'Hello, Welcome back to your account',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 35),
              LoginForm(),
              SizedBox(height: 46),
              SocialLoginMethods(),
            ],
          ),
        ),
      ),
    );
  }
}
