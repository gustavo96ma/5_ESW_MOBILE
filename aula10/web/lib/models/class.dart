import '../utils/turn_enum.dart';

class Class {
  int period;
  String course;
  TurnEnum turn;
  String? observations;
  int studentQuantity;

  Class({
    required this.period,
    required this.course,
    required this.turn,
    this.observations,
    required this.studentQuantity,
  });
}
