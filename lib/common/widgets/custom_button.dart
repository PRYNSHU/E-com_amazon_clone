import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const customButton({super.key,
   required this.text, 
   required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}