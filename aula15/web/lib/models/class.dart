import '../utils/shift_enum.dart';

class Class {
  int id;
  int semester;
  String course;
  String shift;
  String? observations;
  int studentQuantity;
  int customChairQuantity;

  Class({
    required this.id,
    required this.semester,
    required this.course,
    required this.shift,
    this.observations,
    required this.studentQuantity,
    required this.customChairQuantity,
  });
}
