import 'package:flutter/material.dart';
import 'package:weather_app/model/Days_List.dart';
import 'package:weather_app/ui/widget/big_text.dart';
import 'package:weather_app/ui/widget/small_text.dart';

class DaysListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(80, 166, 194, 208),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmallText(text: "Days"),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              height: 2,
              width: double.infinity,
              color: Colors.black,
            ),
            Container(
              height: 520,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: DaysList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(164, 166, 194, 208),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, bottom: 5, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 50,
                                child: SmallText(
                                    text: "${DaysList[index]["name"]}")),
                            Container(
                              height: 50,
                              width: 50,
                              child: Image.asset("assets/01n.png"),
                            ),
                            Container(
                                width: 50,
                                child: SmallText(
                                    size: 14,
                                    text:
                                        "${DaysList[index]["temp1"]}°/${DaysList[index]["temp2"]}°"))
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
