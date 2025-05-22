import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:web/pages/class_page.dart';
import 'modal_inputs.dart';

// TODO: estilo do dropdown
// TODO: vincular uma label com os valores do dropdown

class CreateClassModal extends StatefulWidget {
  final String title;
  final int? id;
  final int? semester;
  final String? course;
  final String? shift;
  final String? observations;
  final int? studentQuantity;
  final int? customChairQuantity;

  const CreateClassModal({
    required this.title,
    super.key,
    this.id,
    this.semester,
    this.course,
    this.shift,
    this.observations,
    this.studentQuantity,
    this.customChairQuantity,
  });

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
  final formValidator = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.id != null &&
        widget.semester != null &&
        widget.course != null &&
        widget.shift != null &&
        widget.studentQuantity != null &&
        widget.customChairQuantity != null) {
      semesterController.text = widget.semester.toString();
      courseController.text = widget.course!;
      selectedShiftValue = widget.shift;
      studentsController.text = widget.studentQuantity!.toString();
      customChairQuantityController.text =
          widget.customChairQuantity!.toString();
    }
  }

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
                  child: Form(
                    key: formValidator,
                    child: Column(
                      spacing: 8,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(fontSize: 20),
                        ),

                        //course
                        ModalInputs(
                          isOnlyNumbers: false,
                          controller: courseController,
                          label: "Curso",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo Curso obrigatório';
                            }
                            return null;
                          },
                        ),
                        //semester
                        ModalInputs(
                            isOnlyNumbers: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo Semestre obrigatório';
                              }
                              return null;
                            },
                            controller: semesterController,
                            label: "Semestre"),
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
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
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
                            isOnlyNumbers: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo Quantidade de alunos obrigatório';
                              }
                              return null;
                            },
                            controller: studentsController,
                            label: "Quantidade de alunos"),
                        //observations
                        ModalInputs(
                            isOnlyNumbers: false,
                            validator: (string) {
                              return null;
                            },
                            controller: observationsController,
                            label: "Observações"),
                        //customChairQuantity
                        ModalInputs(
                            isOnlyNumbers: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo Assentos especiais necessários de alunos obrigatório';
                              }
                              return null;
                            },
                            controller: customChairQuantityController,
                            label: "Assentos especiais necessários"),
                      ],
                    ),
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
                        formValidator.currentState!.validate();
                        if (selectedShiftValue == null) {
                          print(
                              'dropdown de período valor nulo: $selectedShiftValue');
                          return;
                        }
                        try {
                          if (widget.id == null) {
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
                          } else {
                            await Supabase.instance.client.from('class').update(
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
                            ).eq('id', '${widget.id}');
                          }

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
