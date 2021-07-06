import 'dart:async';

import 'package:flutter/foundation.dart';

import '../enums/result_status.dart';

class Result extends ChangeNotifier {
  int turn;
  double stopTime;
  Timer? _timer;
  ResultStatus? status;

  Result({
    required this.turn,
    required this.stopTime,
    this.status,
  });

  void onTimeRunning() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (_) {
      stopTime += 1;
    });
  }

  void onNextRound() {
    _timer?.cancel();
  }
}
