import 'package:flutter/material.dart';
import 'package:web/repositories/class_repository.dart';

import '../models/class.dart';
import '../utils/page_enum.dart';
import '../utils/turn_enum.dart';
import '../widgets/sidebar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final List<Class> classesList = [
    Class(
      course: 'ESW',
      period: 5,
      studentQuantity: 45,
      turn: TurnEnum.nocturnal,
      customChairQuantity: 2,
      observations: 'Alunos são muito legais! Nossa!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ClassRepository().fetchClassData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Color(0xff678256),
            ));
            //TODO: Classe centralizadora com sistema de cores
          }

          return Scaffold(
            body: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Sidebar(selectedPage: PageEnum.classPage),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Color(0xffF1F1F1),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(child: Text('Turmas')),
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap:
                                true, // Prevent the ListView from taking infinite height
                            itemCount: classesList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  '${classesList[index].period}º ${classesList[index].course} ${classesList[index].observations ?? ""}',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
