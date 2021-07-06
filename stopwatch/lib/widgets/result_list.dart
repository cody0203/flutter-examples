import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../helpers/parse_timer.dart';
import '../providers/timer_provider.dart';

import '../models/result.dart';
import '../enums/result_status.dart';

class ResultList extends StatelessWidget {
  Color _updateResultColor(Result result) {
    switch (result.status) {
      case ResultStatus.Largest:
        return Color(0xff37d05c);
      case ResultStatus.Smallest:
        return Color(0xffea4c49);
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: ListView.builder(
        itemCount: timerProvider.results.length,
        itemBuilder: (BuildContext ctx, int index) {
          final result = timerProvider.results[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: ListTile(
              leading: Text(
                'Vòng ${result.turn}',
                style: TextStyle(
                  color: _updateResultColor(result),
                ),
              ),
              trailing: Text(
                ParseTimer.parseTimer(
                  result.stopTime,
                ),
                style: TextStyle(
                  color: _updateResultColor(result),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
