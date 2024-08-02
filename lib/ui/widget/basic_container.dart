import 'package:flutter/material.dart';
import 'package:weather_app/ui/style/app%20_color.dart';
import 'package:weather_app/ui/widget/small_text.dart';

class BasicContainer extends StatelessWidget {
  BasicContainer({required this.imgPath, required this.text});
  String imgPath = "";
  String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          height: 70,
          width: 70,
          child: Image.asset(
            "assets/$imgPath.png",
            width: 50,
            height: 50,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.curentColor2),
        ),
        SizedBox(
          height: 10,
        ),
        SmallText(text: text)
      ],
    );
  }
}
