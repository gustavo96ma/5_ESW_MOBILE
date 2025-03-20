import 'package:flutter/material.dart';
import 'package:web/utils/page_enum.dart';

import '../pages/class_page.dart';
import 'menu_list_item.dart';

class Sidebar extends StatefulWidget {
  late PageEnum selectedPage;
  Sidebar({super.key, required PageEnum selectedPage});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.175,
      child: Container(
        color: Color(0xff7c9c6c),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                decoration: BoxDecoration(),
                child: Text(
                  'Ensala+',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              MenuListItem(
                  isSelected: widget.selectedPage == PageEnum.schedulingPage,
                  text: 'Ensalamento',
                  onTap: () {},
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
