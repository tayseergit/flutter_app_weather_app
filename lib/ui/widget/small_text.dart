import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText(
      {super.key,
      required this.text,
      this.size = 20,
      this.color = Colors.black,
      this.weight});
  String text;
  Color color;
  double size;
  FontWeight? weight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
