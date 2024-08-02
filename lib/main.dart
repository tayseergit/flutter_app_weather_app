import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/domain/api_call.dart';
import 'package:weather_app/ui/pages/Home_page.dart';
import 'package:weather_app/ui/pages/splash_screen.dart';

void main() {
  ApiCall.initData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
