import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'modal_inputs.dart';

// TODO: estilo do dropdown
// TODO: vincular uma label com os valores do dropdown

class CreateClassModal extends StatefulWidget {
  const CreateClassModal({super.key});

  @override
  State<CreateClassModal> createState() => _CreateClassModalState();
}

class _CreateClassModalState extends State<CreateClassModal> {
  TextEditingController courseController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController studentsController = TextEditingController();
  TextEditingController observationsController = TextEditingController();
  TextEditingController customChairQuantityController = TextEditingController();
  List<String> periodOptions = ["manha", "tarde", "noite"];
  String? selectedPeriodValue;

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
                      //period
                      ModalInputs(
                          controller: periodController, label: "Semestre"),
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
                            items: periodOptions
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
                            value: selectedPeriodValue,
                            onChanged: (String? value) {
                              setState(() {
                                selectedPeriodValue = value;
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
                        try {
                          await Supabase.instance.client.from('class').insert(
                            {
                              'course': courseController.text,
                              'period': selectedPeriodValue,
                              'shift': shiftController.text,
                              'studentsCount': shiftController.text,
                              'observations': observationsController.text,
                              'customChairQuantity':
                                  customChairQuantityController.text
                            },
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
