import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/action_button.dart';
import '../providers/timer_provider.dart';
import '../enums/timer_state.dart';

class TimerActions extends StatelessWidget {
  final Map<String, Map<TimerState, Color>> leftColors = {
    'background': {
      TimerState.Idle: Color(0xff1c1c1e),
      TimerState.Running: Color(0xff333333),
      TimerState.Stop: Color(0xff333333),
    },
    'text': {
      TimerState.Idle: Color(0xff9d9ca2),
      TimerState.Running: Colors.white,
      TimerState.Stop: Colors.white,
    },
  };

  final Map<String, Map<TimerState, Color>> rightColors = {
    'background': {
      TimerState.Idle: Color(0xff0a2a12),
      TimerState.Running: Color(0xff340e0d),
      TimerState.Stop: Color(0xff0a2a12),
    },
    'text': {
      TimerState.Idle: Color(0xff37d05c),
      TimerState.Running: Color(0xffea4c49),
      TimerState.Stop: Color(0xff37d05c),
    },
  };

  final Map<TimerState, String> leftTextButton = {
    TimerState.Idle: 'Vòng',
    TimerState.Running: 'Vòng',
    TimerState.Stop: 'Đặt lại',
  };

  final Map<TimerState, String> rightTextButton = {
    TimerState.Idle: 'Bắt đầu',
    TimerState.Running: 'Dừng',
    TimerState.Stop: 'Bắt đầu',
  };

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ActionButton(
            buttonBgColor: leftColors['background']![timerProvider.timerState]!,
            textColor: leftColors['text']![timerProvider.timerState]!,
            textButton: leftTextButton[timerProvider.timerState]!,
            onPress: timerProvider.onLeftButtonPress,
          ),
          ActionButton(
            buttonBgColor:
                rightColors['background']![timerProvider.timerState]!,
            textColor: rightColors['text']![timerProvider.timerState]!,
            textButton: rightTextButton[timerProvider.timerState]!,
            onPress: timerProvider.onRightButtonPress,
          ),
        ],
      ),
    );
  }
}
