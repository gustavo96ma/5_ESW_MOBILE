import 'package:flutter/material.dart';

class ModalInputs extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const ModalInputs({super.key, required this.controller, required this.label});

  @override
  State<ModalInputs> createState() => _ModalInputsState();
}

class _ModalInputsState extends State<ModalInputs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: TextField(
        cursorColor: Color(0xff678256),
        style: TextStyle(),
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: TextStyle(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff678256)),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
