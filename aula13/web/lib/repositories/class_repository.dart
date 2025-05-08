import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web/utils/turn_enum.dart';

import '../models/class.dart';

class ClassRepository {
// Get a reference your Supabase client
  final supabase = Supabase.instance.client;

  Future<List<Class>> fetchClassData() async {
    final classesData = await supabase.from('class').select();

    return formatClassesData(classesData);
  }

  List<Class> formatClassesData(PostgrestList classesData) {
    List<Class> formattedClassesData = [];

    for (var index = 0; index < classesData.length; index++) {
      try {
        formattedClassesData.add(
          Class(
            course: classesData[index]['course'],
            customChairQuantity: classesData[index]['customChairQuantity'],
            period: int.parse(classesData[index]['period']),
            studentQuantity: classesData[index]['studentsCount'],
            turn: shiftToTurn(classesData[index]['shift']),
            observations: classesData[index]['observations'],
          ),
        );
      } catch (e) {
        print('Erro ao processar item no índice $index: $e');
      }
    }

    return formattedClassesData;
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
