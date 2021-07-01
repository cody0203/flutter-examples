import 'package:flutter/material.dart';
import 'package:the_light/widgets/traffic_light.dart/appButton.dart';

enum TrafficLightColor {
  Red,
  Yellow,
  Green,
}

class TrafficLight extends StatefulWidget {
  @override
  _TrafficLightState createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  String trafficLightImage = 'assets/images/traffic-light.png';

  void setTrafficLightImage(String newAssetDirection) {
    setState(() {
      trafficLightImage = newAssetDirection;
    });
  }

  void _changeTrafficLightColor(TrafficLightColor color) {
    switch (color) {
      case TrafficLightColor.Red:
        setTrafficLightImage('assets/images/traffic-light-red.png');
        break;
      case TrafficLightColor.Yellow:
        setTrafficLightImage('assets/images/traffic-light-yellow.png');
        break;
      case TrafficLightColor.Green:
        setTrafficLightImage('assets/images/traffic-light-green.png');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          gaplessPlayback: true,
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 500,
          fit: BoxFit.contain,
          image: AssetImage(trafficLightImage),
        ),
        SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AppButton(
              content: 'Red',
              onPress: () {
                _changeTrafficLightColor(TrafficLightColor.Red);
              },
              buttonBg: Color(0xffce0100),
              overlayColor: Color(0xff9b0100),
            ),
            AppButton(
              content: 'Yellow',
              onPress: () {
                _changeTrafficLightColor(TrafficLightColor.Yellow);
              },
              buttonBg: Color(0xffff8300),
              overlayColor: Color(0xffcc6900),
            ),
            AppButton(
              content: 'Green',
              onPress: () {
                _changeTrafficLightColor(TrafficLightColor.Green);
              },
              buttonBg: Color(0xff54a111),
              overlayColor: Color(0xff3c730c),
            ),
          ],
        ),
      ],
    );
  }
}
