import 'package:flutter/material.dart';
import 'package:web/utils/page_enum.dart';

import '../widgets/sidebar.dart';

class SchedulingPage extends StatelessWidget {
  const SchedulingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Sidebar(
            selectedPage: PageEnum.schedulingPage,
          ),
          Expanded(
            child: Container(
              color: Color(0xffF1F1F1),
            ),
          )
        ],
      ),
    );
  }
}
