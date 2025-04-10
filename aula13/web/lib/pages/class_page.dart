import 'package:flutter/material.dart';
import 'package:web/repositories/class_repository.dart';

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
            //TODO: Finalizar Classe centralizadora com sistema de cores
            //TODO: Adicionar um botão de logout na homepage
          }

          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
                child: Text('Não foram encontradas turmas no servidor'));
          }

          final finalClassData = snapshot.data;
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
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 10, 24, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Turmas', style: TextStyle(fontSize: 26)),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add)),
                            ],
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap:
                                true, // Prevent the ListView from taking infinite height
                            itemCount: finalClassData!.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  trailing: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.delete)),
                                      ],
                                    ),
                                  ),
                                  title: Text(
                                    '${finalClassData[index].period}º ${finalClassData[index].course} ${finalClassData[index].observations ?? ""} | Qtd. alunos: ${finalClassData[index].studentQuantity}',
                                  ),
                                  subtitle: Text(
                                      'Qtd. alunos: ${finalClassData[index].studentQuantity}'),
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
