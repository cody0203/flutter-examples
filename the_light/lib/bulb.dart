import 'dart:io';

import 'package:flutter/material.dart';
import 'package:the_light/widgets/bulb/adaptive_switch.dart';

class Bulb extends StatefulWidget {
  @override
  _BulbState createState() => _BulbState();
}

class _BulbState extends State<Bulb> {
  bool _isBulbTurnOn = false;

  void _onSwitching(bool newStatus) {
    setState(() {
      _isBulbTurnOn = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 400,
          image: AssetImage(
            _isBulbTurnOn
                ? 'assets/images/bulb-on.jpeg'
                : 'assets/images/bulb-off.jpeg',
          ),
          fit: BoxFit.contain,
        ),
        AdaptiveSwitch(
          isActve: _isBulbTurnOn,
          onChanged: _onSwitching,
        ),
      ],
    );
  }
}
