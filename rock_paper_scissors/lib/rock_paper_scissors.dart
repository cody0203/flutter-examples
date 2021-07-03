import 'package:flutter/material.dart';

import './widgets/results.dart';
import './widgets/action_bar.dart';

import '../models/result.dart';
import '../models/type.dart';

class RockPaperScissors extends StatefulWidget {
  @override
  _RockPaperScissorsState createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  bool canPlay = true;
  bool isStart = false;
  String result = '';
  late ActionType playerChosen;
  late ActionType computerChosen;
  bool isCompleteThinking = false;

  final Map<Result, String> mappingResult = {
    Result.Draw: "Draw!",
    Result.Win: "Win!",
    Result.Lose: "Lose!",
  };

  void _startGame(ActionType playerAction) {
    setState(() {
      isStart = true;
      playerChosen = playerAction;
    });
  }

  Result get _renderResult {
    if (playerChosen != computerChosen) {
      switch (playerChosen) {
        case ActionType.Paper:
          return computerChosen == ActionType.Rock ? Result.Win : Result.Lose;
        case ActionType.Rock:
          return computerChosen == ActionType.Scissors
              ? Result.Win
              : Result.Lose;
        case ActionType.Scissors:
          return computerChosen == ActionType.Paper ? Result.Win : Result.Lose;
      }
    }

    return Result.Draw;
  }

  void _showResult() {
    setState(() {
      isCompleteThinking = true;
      computerChosen = ActionTypeExtension.getRandomAction();
      result = mappingResult[_renderResult]!;
      canPlay = false;
    });
  }

  void _resetGame() {
    setState(() {
      canPlay = true;
      isStart = false;
      result = '';
      isCompleteThinking = false;
    });
  }

  String _renderHeader() {
    if (!isStart) {
      return 'Make your choice';
    } else if (isStart && result.isEmpty) {
      return 'Waiting for your opponent\'s response';
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(48),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
              alignment: isStart ? Alignment.topCenter : Alignment.center,
              child: Text(
                _renderHeader(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          if (isStart)
            Expanded(
              child: Column(
                children: [
                  Results(
                    leftActionType:
                        result.isNotEmpty ? playerChosen : ActionType.Rock,
                    rightActionType:
                        result.isNotEmpty ? computerChosen : ActionType.Rock,
                    result: result,
                    showResult: _showResult,
                  ),
                  SizedBox(height: 30),
                  if (result.isNotEmpty)
                    ElevatedButton(
                      onPressed: _resetGame,
                      child: Text(
                        'Try Again?',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xfff9d835),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ActionBar(
            onChoose: _startGame,
            isStart: isStart,
          ),
        ],
      ),
    );
  }
}
