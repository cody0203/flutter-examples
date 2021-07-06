import 'package:flutter/material.dart';

import './widgets/timer_actions.dart';
import './widgets/result_list.dart';
import './widgets/timer.dart';

class AppStopwatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Timer(),
                  TimerActions(),
                ],
              ),
            ),
          ),
          ResultList(),
        ],
      ),
    );
  }
}
