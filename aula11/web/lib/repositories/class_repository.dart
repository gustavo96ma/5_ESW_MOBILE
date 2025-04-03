import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web/utils/turn_enum.dart';

import '../models/class.dart';

class ClassRepository {
// Get a reference your Supabase client
  final supabase = Supabase.instance.client;

  Future<List<Class>> fetchClassData() async {
    final classesData = await supabase.from('class').select();

    final List<Class> formattedClassesData = formatClassesData(classesData);

    return formattedClassesData;
  }

  List<Class> formatClassesData(PostgrestList classesData) {
    print(classesData);

    for (var classData in classesData) {
      final Class classInstance = Class(
        course: classData['course'],
        customChairQuantity: classData['customChairQuantity'],
        period: classData['period'],
        studentQuantity: classData['studentsCount'],
        turn: shiftToTurn(classData['shift']),
        observations: classData['observations'],
      );
    }
    return [];
  }

  TurnEnum shiftToTurn(String shift) {
    switch (shift) {
      case 'manha':
        return TurnEnum.morning;

      case 'tarde':
        return TurnEnum.afternoon;

      case 'noite':
        return TurnEnum.nocturnal;

      default:
        return TurnEnum.nocturnal;
    }
  }
}
