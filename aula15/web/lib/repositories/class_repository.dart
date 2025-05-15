import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web/utils/shift_enum.dart';

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
            id: classesData[index]['id'],
            course: classesData[index]['course'],
            customChairQuantity: classesData[index]['customChairQuantity'],
            semester: classesData[index]['semester'],
            studentQuantity: classesData[index]['studentsCount'],
            shift: classesData[index]['shift'],
            observations: classesData[index]['observations'],
          ),
        );
      } catch (e) {
        print('Erro ao processar item no índice $index: $e');
      }
    }

    return formattedClassesData;
  }

  ShiftEnum shiftToshift(String shift) {
    switch (shift) {
      case 'manha':
        return ShiftEnum.morning;

      case 'tarde':
        return ShiftEnum.afternoon;

      case 'noite':
        return ShiftEnum.nocshiftal;

      default:
        return ShiftEnum.nocshiftal;
    }
  }
}
