import 'package:flutter/material.dart';

import 'sections/connect_section.dart';
import 'sections/engage_section.dart';
import 'sections/introduce_section.dart';
import 'sections/vision_section.dart';
import 'widgets/main_app_bar.dart';

class VnseLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              IntroduceSection(),
              VisionSection(),
              ConnectSection(),
              EngageSection(),
            ],
          ),
        ),
      ),
    );
  }
}
