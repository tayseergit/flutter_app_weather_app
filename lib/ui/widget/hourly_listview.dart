import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/local/QueryMap.dart';
import 'package:weather_app/domain/global_controller.dart';
import 'package:weather_app/function/format-Date.dart';
import 'package:weather_app/model/Days_List.dart';
import 'package:weather_app/model/eachday_list.dart';
import 'package:weather_app/ui/pages/Home_page.dart';
import 'package:weather_app/ui/style/app%20_color.dart';
import 'package:weather_app/ui/widget/small_text.dart';

class HourlyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GlobalController controller = Get.put(GlobalController());
    List<dynamic> DayList = QueryMap.querydaily!["list"];
    List<dynamic>? hourData = [];
    hourData.length = 8;
    for (int i = 0; i < 8; i++) {
      Map<String, dynamic> m = {"clock": 0, "temp": 0, "icon": "icon"};
      hourData[i] = m;
      hourData[i]["clock"] = formatDate(DayList[i]["dt"]).hour;
      hourData[i]["temp"] = DayList[i]["main"]["temp"];
      hourData[i]["icon"] = DayList[i]["weather"][0]["icon"];
      // hourData[i]["clock"] = ("clock", "${}");
    }
    // print(hourData);
    return Container(
      height: 180,
      child: ListView.builder(
          itemCount: hourData.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, Index) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColor.curentColor2,
                  AppColor.curentColor,
                ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(
                          weight: FontWeight.w600,
                          size: 18,
                          text: hourData[Index]["clock"] == 0
                              ? "${hourData[Index]["clock"] + 12}:00"
                              : "${hourData[Index]["clock"]}:00"),
                      SmallText(
                        weight: FontWeight.w600,
                        text: hourData[Index]["clock"] < 12 ? " AM" : " PM",
                        size: 15,
                      )
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/${hourData[Index]["icon"]}.png"),
                    // child: Image.asset("assets/moon4.png"),
                  ),
                  SmallText(
                      weight: FontWeight.w600,
                      text: "${hourData[Index]["temp"].toInt()}°")
                ],
              ),
            );
          }),
    );
  }
}
