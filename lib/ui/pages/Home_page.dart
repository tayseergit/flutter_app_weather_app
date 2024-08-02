import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/data/local/QueryMap.dart';
import 'package:weather_app/domain/api_call.dart';
import 'package:weather_app/domain/global_controller.dart';
import 'package:weather_app/function/current_date.dart';
import 'package:weather_app/function/format-Date.dart';
import 'package:weather_app/function/sun_path.dart';
import 'package:weather_app/ui/style/app%20_color.dart';
import 'package:weather_app/ui/widget/Days_listview.dart';
import 'package:weather_app/ui/widget/basic_container.dart';
import 'package:weather_app/ui/widget/big_text.dart';
import 'package:weather_app/ui/widget/hourly_listview.dart';
import 'package:weather_app/ui/widget/small_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalController controller = Get.put(GlobalController());
  double circularDate = 0;

  @override
  void initState() {
    // city["lon"] = controller.getLon().value;
    // city["lat"] = controller.getLit().value;
    // print("////// ${controller.getLit().value}");
    getWeatherData(city);
    getWeatherDataDaily(cityDaily);
    // getSunrise(cityDaily);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (QueryMap.query!.isEmpty)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : (QueryMap.querydaily!.isEmpty)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/background.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: "   ${QueryMap.query?["name"]}",
                                    weight: FontWeight.bold,
                                  ),
                                  SmallText(text: "  ${getCurDate()} "),
                                  SmallText(
                                      text:
                                          "      ${DateTime.now().hour}:${DateTime.now().minute}"),
                                  SizedBox(
                                    height: 25,
                                  ),

                                  //////////////  basic info
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    "${(QueryMap.query!["main"]["temp"]).toInt()} °",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 60)),
                                            TextSpan(
                                                text:
                                                    '${QueryMap.query!["weather"][0]["description"]}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Image.asset(
                                      "assets/${QueryMap.query!["weather"][0]["icon"]}.png")),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  BasicContainer(
                                      imgPath: "windspeed",
                                      text:
                                          "${(QueryMap.query!["wind"]["speed"]).toInt()} km/h"),
                                  BasicContainer(
                                    imgPath: "lightcloud",
                                    text:
                                        "${(QueryMap.query!["clouds"]["all"]).toInt()} %",
                                  ),
                                  BasicContainer(
                                    imgPath: "drop",
                                    text:
                                        "${(QueryMap.query!["main"]["humidity"]).toInt()} %",
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 2,
                                  color: Colors.black),
                              SizedBox(
                                height: 10,
                              ),
                              SmallText(
                                text: "Today",
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                          HourlyList(),
                          SizedBox(
                            height: 10,
                          ),
                          DaysListview(),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    SmallText(
                                      text: "sunrise  ",
                                      size: 14,
                                    ),
                                    SmallText(
                                      text:
                                          " ${QueryMap.sunRise!.hour}:${QueryMap.sunRise!.minute} ",
                                      size: 14,
                                    )
                                  ],
                                ),
                                SleekCircularSlider(
                                  initialValue: SunPath.SunRisePath(),
                                  appearance: CircularSliderAppearance(
                                    size: 200,
                                    startAngle: 180,
                                    angleRange: 180,
                                    customWidths:
                                        CustomSliderWidths(progressBarWidth: 5),
                                    customColors: CustomSliderColors(
                                      progressBarColors: [
                                        Color.fromARGB(255, 12, 56, 93),
                                        Color.fromARGB(60, 123, 143, 186)
                                      ],
                                      // trackColor: Colors.grey,
                                      // dotColor: Colors.red,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SmallText(
                                      text: "  sunset",
                                      size: 14,
                                    ),
                                    SmallText(
                                      text:
                                          " ${QueryMap.sunSet!.hour - 12}:${QueryMap.sunSet!.minute} ",
                                      size: 14,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
  }

  void getWeatherData(Map<String, dynamic> queryParms) {
    ApiCall.getData(url: 'weather', queryParms: queryParms).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          QueryMap.query = value.data;
          // query?["weather"][0]["main"] = "heavycloud";
        });
        // print(value.data);
      }
    }).catchError((e) {});
  }

  void getWeatherDataDaily(Map<String, dynamic> queryParms) {
    ApiCall.getDataDaily(url: 'forecast', queryParms: queryParms).then((value) {
      if (value.statusCode == 200) {
        setState(() {
          QueryMap.querydaily = value.data;
          QueryMap.sunRise = formatDate(value.data["city"]["sunrise"]);
          QueryMap.sunSet = formatDate(value.data["city"]["sunset"]);

          // query?["weather"][0]["main"] = "heavycloud";
        });

        // circularDate = DateTime.now();

        int comparisonResult = DateTime.now().compareTo(QueryMap.sunRise!);
        int comparisonResult1 = DateTime.now().compareTo(QueryMap.sunSet!);
        if (comparisonResult > 0 && comparisonResult1 < 0) {
          // day
          setState(() {
            AppColor.curentColor = AppColor.dayColor;
            AppColor.curentColor2 = AppColor.dayColor2;
            QueryMap.isDay = true;
          });
        } else {
          setState(() {
            AppColor.curentColor = AppColor.nightColor1;
            AppColor.curentColor2 = AppColor.nightColor2;
            QueryMap.isDay = false;
          });
        }
        // print(value.data);
        // print(QueryMap.sunRise);

        // print(QueryMap.sunSet);
        // print("okkkkkkkkk");
      }
    }).catchError((e) {});
  }

  Map<String, dynamic> artuz = {
    "lon": 36.2913,
    "lat": 33.5102,
    'appid': 'd9941a3a9b5909056383161dc72dfe3a',
    "units": "metric",
    "lang": "ar",
    // "q": "Artuz"
  };
  Map<String, dynamic> city = {
    "lon": 36.148215, // 33.422171,
    "lat": 33.422171,
    'appid': 'd9941a3a9b5909056383161dc72dfe3a',
    "units": "metric",
    "lang": "ar",
    // "q": "Macca"
  };
  Map<String, dynamic> cityDaily = {
    "lon": 36.148215, // 33.422171,
    "lat": 33.422171,
    'appid': 'd9941a3a9b5909056383161dc72dfe3a',
    "units": "metric",
    "lang": "ar",
    "cnt": 24,
  };
}
