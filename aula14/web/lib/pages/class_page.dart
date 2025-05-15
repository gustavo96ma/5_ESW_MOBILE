import 'package:flutter/material.dart';
import 'package:web/repositories/class_repository.dart';
import 'package:web/widgets/create_class_modal.dart';

import '../utils/page_enum.dart';
import '../widgets/sidebar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
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

          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
                child: Text('Não foram encontradas turmas no servidor'));
          }

          final finalClassData = snapshot.data;
          return Scaffold(
            floatingActionButton: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
              child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color(0xff7c9c6c),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return CreateClassModal();
                        });
                  },
                  icon: Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                  )),
            ),
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
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Turmas',
                            style: TextStyle(fontSize: 26),
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap:
                                true, // Prevent the ListView from taking infinite height
                            itemCount: finalClassData!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                tileColor: Colors.red,
                                title: Text(
                                  '${finalClassData[index].semester}º ${finalClassData[index].course} ${finalClassData[index].observations ?? ""} | Qtd. alunos: ${finalClassData[index].studentQuantity}',
                                ),
                                subtitle: Text(
                                    'Qtd. alunos: ${finalClassData[index].studentQuantity}'),
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
