import 'package:flutter/material.dart';

class Textboxfield extends StatefulWidget {
  final String text;
  final IconData iconName;
  final TextEditingController txtcontroller;
  const Textboxfield(
      {super.key,
      required this.text,
      required this.iconName,
      required this.txtcontroller});

  @override
  State<Textboxfield> createState() => _TextboxfieldState();
}

class _TextboxfieldState extends State<Textboxfield> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: widget.txtcontroller,
        decoration: InputDecoration(
            hintText: widget.text,
            icon: Icon(
              widget.iconName,
              color: Colors.black,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
