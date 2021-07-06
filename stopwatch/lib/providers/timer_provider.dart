import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/result.dart';

import '../enums/timer_state.dart';
import '../enums/result_status.dart';

class TimerProvider extends ChangeNotifier {
  double _time = 0;
  TimerState _timerState = TimerState.Idle;
  List<Result> _results = [];
  Timer? _timer;

  double get time => _time;
  TimerState get timerState => _timerState;
  List<Result> get results => [..._results];
  Result get lastestResult => _results[0];

  void updateResultStatus() {
    final smallestResultTime =
        _results.skip(1).reduce((a, b) => a.stopTime < b.stopTime ? a : b);
    final largestResultTime =
        _results.skip(1).reduce((a, b) => a.stopTime > b.stopTime ? a : b);

    _results = _results.map((result) {
      result.status = null;
      if (smallestResultTime.turn == result.turn) {
        result.status = ResultStatus.Smallest;
      }
      if (largestResultTime.turn == result.turn) {
        result.status = ResultStatus.Largest;
      }

      return result;
    }).toList();
  }

  void onLeftButtonPress() {
    switch (_timerState) {
      case TimerState.Running:
        _results.insert(
          0,
          Result(
            turn: _results.length + 1,
            stopTime: 0,
          )..onTimeRunning(),
        );
        lastestResult.onNextRound();
        if (results.length > 2) {
          updateResultStatus();
        }
        notifyListeners();
        break;
      case TimerState.Stop:
        _results = [];
        _time = 0;
        _timerState = TimerState.Idle;
        notifyListeners();
        break;
      default:
        break;
    }
  }

  void triggerTimer() {
    _timerState = TimerState.Running;
    notifyListeners();
    _timer = Timer.periodic(Duration(milliseconds: 10), (_) {
      _time += 1;
      lastestResult.stopTime += 1;
      notifyListeners();
    });
  }

  void onRightButtonPress() {
    switch (_timerState) {
      case TimerState.Idle:
        _results.insert(
            0,
            Result(
              turn: _results.length + 1,
              stopTime: 0,
            ));
        triggerTimer();
        notifyListeners();
        break;
      case TimerState.Stop:
        triggerTimer();
        break;
      case TimerState.Running:
        _timer?.cancel();
        lastestResult.onNextRound();

        _timerState = TimerState.Stop;
        notifyListeners();
        break;
      default:
        break;
    }
  }
}
