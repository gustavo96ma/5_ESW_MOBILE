import 'package:flutter/material.dart';

import 'modal_inputs.dart';

//TODO: criar os botões "Cancelar" e "Salvar" e implementar o insert no database

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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        width: 200,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                ModalInputs(controller: periodController, label: "Semestre"),
                //shift
                ModalInputs(controller: shiftController, label: "Período"),
                //studentsCount
                ModalInputs(
                    controller: studentsController,
                    label: "Quantidade de alunos"),
                //observations
                ModalInputs(
                    controller: observationsController, label: "Observações"),
                //customChairQuantity
                ModalInputs(
                    controller: customChairQuantityController,
                    label: "Assentos especiais necessários"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
