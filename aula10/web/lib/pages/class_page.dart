import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/page_enum.dart';
import '../widgets/sidebar.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({super.key});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  Future<List<Map<String, dynamic>>> getClassesData() async {
    var select = await Supabase.instance.client.from('class').select('*');
    print(select);
    return select;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getClassesData(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          Scaffold(
            body: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Sidebar(selectedPage: PageEnum.classPage),
                Expanded(
                  child: Container(
                    color: Color(0xffF1F1F1),
                    child: ListView.builder(
                        itemCount: select.len,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                '${select[index]["period"]} ${select[index]["course"]}'),
                          );
                        }),
                  ),
                )
              ],
            ),
          );
        });
  }
}
