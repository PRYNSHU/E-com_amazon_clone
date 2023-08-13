import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {

  final TextEditingController controllers;
  final String hinttext;
  const customTextField({super.key , required this.controllers, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllers,
      validator: (value) {
        
      },
      decoration: InputDecoration(
        hintText: hinttext,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
