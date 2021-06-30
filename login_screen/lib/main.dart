import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './facebook_login.dart';
import './momo_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // Momo styles
          // textTheme: TextTheme(
          //   bodyText2: TextStyle(
          //     color: Colors.white,
          //     fontSize: 16,
          //   ),
          //   headline6: TextStyle(
          //     color: Colors.white,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),

          // Facebook styles
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Color(0xff1977f3),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            headline6: TextStyle(
              color: Color(0xff1977f3),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Momo login background
      // backgroundColor: Color(0xffb0006d),
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          top: false,
          child: FacebookLogin(),
        ),
        // child: MomoLogin(),
      ),
    );
  }
}
