import 'package:flutter/material.dart';
import 'package:web/widgets/menu_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
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
                        text: 'Turmas',
                        onTap: () {},
                        icon: Icons.people_outlined),
                    MenuListItem(
                      text: 'Salas',
                      onTap: () {},
                      icon: Icons.room_outlined,
                    ),
                    MenuListItem(
                        text: 'Ensalamento',
                        onTap: () {},
                        icon: Icons.door_back_door_outlined),
                  ]),
            ),
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
