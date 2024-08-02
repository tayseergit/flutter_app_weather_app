import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BigText extends StatelessWidget {
  BigText(
      {super.key,
      required this.text,
      this.size = 40,
      this.color = Colors.black,
      this.weight});
  String text;
  Color color;
  double size;
  FontWeight? weight = FontWeight.normal;
  TextDirection? textDire = TextDirection.RTL;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
