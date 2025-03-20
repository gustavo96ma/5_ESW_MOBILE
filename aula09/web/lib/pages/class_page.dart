import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Sidebar(selectedPage: PageEnum.classPage),
          Expanded(
            child: Container(
              color: Color(0xffF1F1F1),
            ),
          )
        ],
      ),
    );
    ;
  }
}
