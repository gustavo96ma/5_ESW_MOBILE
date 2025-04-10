import 'package:flutter/material.dart';

import '../utils/colors_manager.dart';

class MenuListItem extends StatefulWidget {
  final String text;
  final void Function() onTap;
  final IconData icon;
  final bool isSelected;

  const MenuListItem({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });

  @override
  State<MenuListItem> createState() => _MenuListItemState();
}

class _MenuListItemState extends State<MenuListItem> {
  bool shouldPaint() {
    return isHovered || widget.isSelected;
  }

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    ColorsManager colorsManager = ColorsManager();
    return MouseRegion(
      onHover: (value) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration:
              BoxDecoration(color: shouldPaint() ? Color(0xff9bb788) : null),
          child: Row(
            spacing: 8,
            children: [
              Icon(
                widget.icon,
                color: colorsManager.white,
              ),
              Text(
                widget.text,
                style: TextStyle(color: colorsManager.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
