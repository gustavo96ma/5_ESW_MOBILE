import 'package:flutter/material.dart';

class MenuListItem extends StatefulWidget {
  final String text;
  final void Function() onTap;
  final IconData icon;

  const MenuListItem({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  State<MenuListItem> createState() => _MenuListItemState();
}

class _MenuListItemState extends State<MenuListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(),
        child: Row(
          spacing: 8,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
