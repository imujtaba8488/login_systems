import 'package:flutter/material.dart';

import '../global.dart';

class TextFormField02 extends StatelessWidget {
  final String hintText;
  final Color fillColor, hintTextColor;
  final Validator validator;
  final Function onSaved;
  final bool obscureText;

  TextFormField02({
    this.hintText,
    this.fillColor = const Color(0xFFC0C0C0),
    this.hintTextColor = Colors.white,
    this.validator,
    this.onSaved,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xFFC0C0C0),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: false,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: hintTextColor,
          ),
        ),
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
