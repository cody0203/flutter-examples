import 'dart:math';

enum ActionType {
  Rock,
  Paper,
  Scissors,
}

extension ActionTypeExtension on ActionType {
  static ActionType getRandomAction() {
    final randomIndex = Random().nextInt(ActionType.values.length);
    return ActionType.values[randomIndex];
  }
}
