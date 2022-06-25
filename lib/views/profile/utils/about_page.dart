import 'package:flutter/material.dart';
import 'package:servicr_sp/views/profile/utils/aboutUI.dart';
//import 'package:info/aboutUI.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Colors.cyan,
//       ),
//       home: MyApp(),
//     ));

class AboutPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: aboutUI(),
    );
  }
}
