import 'package:flutter/material.dart';

class HeaderLabel extends StatelessWidget {
  final String text;
  final double topPadding;

  HeaderLabel({this.text, this.topPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Pacifico',
          color: Colors.grey[800],
        ),
      ),
    );
  }
}