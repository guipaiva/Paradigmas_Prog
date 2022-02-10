import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget logo(
    {final String text = 'VeriNews',
    double fontSize = 12,
    double strokeWidth = 2,
    Color textColor = Colors.red,
    Color strokeColor = Colors.black}) {
  return Stack(
    children: <Widget>[
      Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: fontSize,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = strokeColor,
        ),
      ),
      Text(text,
          style: GoogleFonts.roboto(fontSize: fontSize, color: textColor)),
    ],
  );
}
