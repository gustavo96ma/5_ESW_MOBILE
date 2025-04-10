import 'package:flutter/material.dart';
import 'package:web/pages/scheduling_page.dart';
import 'package:web/utils/colors_manager.dart';
import 'package:web/utils/page_enum.dart';

import '../pages/class_page.dart';
import 'menu_list_item.dart';

class Sidebar extends StatefulWidget {
  final PageEnum selectedPage;
  const Sidebar({
    super.key,
    required this.selectedPage,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  ColorsManager colorsManager = ColorsManager();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.175,
      child: Container(
        color: colorsManager.mainColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                decoration: BoxDecoration(),
                child: Text(
                  'Ensala+',
                  style: TextStyle(fontSize: 24, color: colorsManager.white),
                ),
              ),
              Divider(
                color: colorsManager.white,
              ),
              MenuListItem(
                  isSelected: widget.selectedPage == PageEnum.schedulingPage,
                  text: 'Ensalamento',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SchedulingPage()));
                  },
                  icon: Icons.door_back_door_outlined),
              MenuListItem(
                  isSelected: widget.selectedPage == PageEnum.classPage,
                  text: 'Turmas',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ClassPage()));
                  },
                  icon: Icons.people_outlined),
              MenuListItem(
                isSelected: widget.selectedPage == PageEnum.classRoomPage,
                text: 'Salas',
                onTap: () {},
                icon: Icons.room_outlined,
              ),
              MenuListItem(
                isSelected: widget.selectedPage == PageEnum.professorPage,
                text: 'Professores',
                onTap: () {},
                icon: Icons.person_outlined,
              ),
            ]),
      ),
    );
  }
}
