import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/type.dart';

class Results extends StatefulWidget {
  final ActionType leftActionType;
  final ActionType rightActionType;
  final String result;
  final VoidCallback showResult;

  Results({
    this.leftActionType = ActionType.Rock,
    this.rightActionType = ActionType.Rock,
    required this.result,
    required this.showResult,
  });

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> with TickerProviderStateMixin {
  final Map<ActionType, IconData> mappingIcon = {
    ActionType.Paper: FontAwesomeIcons.solidHandPaper,
    ActionType.Rock: FontAwesomeIcons.solidHandRock,
    ActionType.Scissors: FontAwesomeIcons.solidHandScissors,
  };
  int animationCounter = 0;

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  )..fling();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0),
    end: const Offset(0, 1),
  ).animate(CurvedAnimation(
    parent: _animationController,
    curve: Curves.linear,
  ));

  @override
  void initState() {
    super.initState();
    _animationController.addStatusListener(_stopLeftAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController.removeStatusListener(_stopLeftAnimation);
    super.dispose();
  }

  void _stopLeftAnimation(status) {
    _stopAnimation(status, _animationController);
  }

  void _stopAnimation(status, controller) {
    if (animationCounter == 5) {
      widget.showResult();
      return;
    }

    if (status == AnimationStatus.completed) {
      controller.reverse();
      animationCounter += 1;
    }
    if (status == AnimationStatus.dismissed) {
      controller.forward();
      animationCounter += 1;
    }
  }

  Widget _renderIcon(IconData? icon) {
    return Icon(
      icon,
      size: 64,
      color: Color(0xfff9d835),
    );
  }

  Widget _renderLeftSide() {
    switch (widget.leftActionType) {
      case ActionType.Paper:
      case ActionType.Rock:
        return Transform.rotate(
          angle: -80,
          child: _renderIcon(
            mappingIcon[widget.leftActionType],
          ),
        );
      case ActionType.Scissors:
        return Transform(
          transform: Matrix4.rotationY(3),
          alignment: Alignment.center,
          child: _renderIcon(
            mappingIcon[widget.leftActionType],
          ),
        );
    }
  }

  Widget _renderRightSide() {
    switch (widget.rightActionType) {
      case ActionType.Paper:
      case ActionType.Rock:
        return Transform(
          transform: Matrix4.rotationY(3)..rotateZ(7.9),
          child: _renderIcon(
            mappingIcon[widget.rightActionType],
          ),
        );
      case ActionType.Scissors:
        return _renderIcon(
          mappingIcon[widget.rightActionType],
        );
    }
  }

  Widget _renderAnimatedBuilder({
    required List<Widget> children,
  }) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Column(
        children: children,
      ),
      builder: (BuildContext ctx, Widget? child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _renderAnimatedBuilder(
            children: [
              _renderLeftSide(),
              SizedBox(height: 16),
              Text('You'),
            ],
          ),
          _renderAnimatedBuilder(
            children: [
              _renderRightSide(),
              SizedBox(height: 16),
              Text('Computer'),
            ],
          ),
          // AnimatedBuilder(
          //   animation: _animationController,
          //   child: Column(
          //     children: [
          //       _renderLeftSide(),
          //       SizedBox(height: 16),
          //       Text('You'),
          //     ],
          //   ),
          //   builder: (BuildContext ctx, Widget? child) {
          //     return SlideTransition(
          //       position: _offsetAnimation,
          //       child: child,
          //     );
          //   },
          // ),
          // Column(
          //   children: [
          //     _renderRightSide(),
          //     SizedBox(height: 16),
          //     Text('Computer'),
          //   ],
          // ),
        ],
      ),
    );
  }
}
