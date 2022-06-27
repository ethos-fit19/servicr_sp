import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BuildContext,
        Colors,
        ElevatedButton,
        ElevatedButtonThemeData,
        IconThemeData,
        Key,
        StatelessWidget,
        ThemeData,
        Widget,
        runApp;
import 'package:get/get.dart';
import 'package:servicr_sp/views/welcome/welcome.dart';
import 'package:servicr_sp/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily: 'LS',
          primaryColor: AppColor.s_blue,
          iconTheme: IconThemeData(color: AppColor.s_blue),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: AppColor.s_blue, // background (button) color
              onPrimary: Colors.white, // foreground (text) color
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.s_blue,
          )),
      title: "Servicr",
      home: WelcomePage(),
    );
  }
}
