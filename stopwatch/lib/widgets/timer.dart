import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/timer_provider.dart';
import '../helpers/parse_timer.dart';

class Timer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Expanded(
      child: Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            ParseTimer.parseTimer(
              timerProvider.time,
            ),
            style: Theme.of(context).textTheme.bodyText2?.merge(
                  TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
