import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import './instagram_feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          bodyText1: TextStyle(
            color: Color.fromRGBO(142, 142, 142, 1),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final primaryDark = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryDark,
      appBar: AppBar(
        backgroundColor: primaryDark,
        brightness: Brightness.dark,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            FeatherIcons.camera,
            size: 24,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(
                right: 16,
              ),
              child: Icon(
                FeatherIcons.send,
                size: 24,
              ),
            ),
          ),
        ],
        title: Image(
          height: 30,
          fit: BoxFit.contain,
          image: AssetImage('assets/images/white_logo.png'),
        ),
      ),
      body: SafeArea(
        child: InstagramFeed(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        fixedColor: Colors.white,
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.search,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.plusSquare,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.heart,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
