import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/type.dart';

class ActionBar extends StatelessWidget {
  final Function onChoose;
  final bool isStart;

  final Map<ActionType, IconData> mappingIcon = {
    ActionType.Paper: FontAwesomeIcons.handPaper,
    ActionType.Rock: FontAwesomeIcons.handRock,
    ActionType.Scissors: FontAwesomeIcons.handScissors,
  };

  ActionBar({
    required this.onChoose,
    required this.isStart,
  });

  Widget _renderIconButton(ActionType actionType) {
    final icon = Icon(
      mappingIcon[actionType],
      size: 32,
    );

    return IconButton(
      onPressed: isStart
          ? null
          : () {
              onChoose(actionType);
            },
      icon: icon,
    );
  }

  Widget _renderAction({
    required ActionType actionType,
    bool needRotate = false,
  }) {
    return Container(
      height: 64,
      width: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xfff9d835),
        borderRadius: BorderRadius.circular(
          32,
        ),
      ),
      child: needRotate
          ? Transform.rotate(
              angle: 1.5,
              child: _renderIconButton(actionType),
            )
          : _renderIconButton(actionType),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _renderAction(
            actionType: ActionType.Rock,
          ),
          _renderAction(
            actionType: ActionType.Paper,
          ),
          _renderAction(
            actionType: ActionType.Scissors,
            needRotate: true,
          ),
        ],
      ),
    );
  }
}
