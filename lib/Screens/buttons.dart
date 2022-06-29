// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color buttoncolor;
  final Color textcolor;
  final String buttontext;
  final ontapped;

  const Buttons(
      {required this.buttoncolor,
      required this.buttontext,
      required this.textcolor,
      required this.ontapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapped,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: buttoncolor,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
