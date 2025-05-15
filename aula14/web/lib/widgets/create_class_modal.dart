import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:web/pages/class_page.dart';
import 'modal_inputs.dart';

// TODO: estilo do dropdown
// TODO: vincular uma label com os valores do dropdown
// TODO: implmentar edit e delete

class CreateClassModal extends StatefulWidget {
  const CreateClassModal({super.key});

  @override
  State<CreateClassModal> createState() => _CreateClassModalState();
}

class _CreateClassModalState extends State<CreateClassModal> {
  TextEditingController courseController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController studentsController = TextEditingController();
  TextEditingController observationsController = TextEditingController();
  TextEditingController customChairQuantityController = TextEditingController();
  List<String> shiftOptions = ["manha", "tarde", "noite"];
  String? selectedShiftValue;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 300,
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  primary: true,
                  child: Column(
                    spacing: 8,
                    children: [
                      Text(
                        'Cadastrar turma',
                        style: TextStyle(fontSize: 20),
                      ),
                      //course
                      ModalInputs(controller: courseController, label: "Curso"),
                      //semester
                      ModalInputs(
                          controller: semesterController, label: "Semestre"),
                      //shift
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Selecione o período',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: shiftOptions
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedShiftValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedShiftValue = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              elevation: 2,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      //studentsCount
                      ModalInputs(
                          controller: studentsController,
                          label: "Quantidade de alunos"),
                      //observations
                      ModalInputs(
                          controller: observationsController,
                          label: "Observações"),
                      //customChairQuantity
                      ModalInputs(
                          controller: customChairQuantityController,
                          label: "Assentos especiais necessários"),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: TextButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xff7c9c6c))),
                      onPressed: () async {
                        if (selectedShiftValue == null) {
                          print(
                              'dropdown de período valor nulo: $selectedShiftValue');
                          return;
                        }
                        try {
                          await Supabase.instance.client.from('class').insert(
                            {
                              'course': courseController.text,
                              'semester': int.parse(semesterController.text),
                              'shift': selectedShiftValue,
                              'studentsCount':
                                  int.parse(studentsController.text),
                              'observations': observationsController.text,
                              'customChairQuantity':
                                  customChairQuantityController.text
                            },
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassPage()),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      label: Text(
                        'Salvar',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.save_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
