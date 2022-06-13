import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants.dart';

class AppointmentsPage extends StatefulWidget {
  AppointmentsPage({Key? key}) : super(key: key);

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Appointments"),
      ),
      body: Container(
          child:SingleChildScrollView(
           child: Column(
            children: [
              const SizedBox(height: 20,),
              SafeArea(
                child: TableCalendar(
                  firstDay: DateTime.utc(2010,10,20),
                  lastDay: DateTime.utc(2040,10,20),
                  focusedDay: DateTime.now(),
                 // headerVisible: false,
                  //daysOfWeekVisible: false,
                 // shouldFillViewport: true,
                 // sixWeekMonthsEnforced: true,
                  headerStyle: const HeaderStyle(
                      titleTextStyle: TextStyle
                        (
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                      )
                  ),
                  calendarStyle: const CalendarStyle
                    (
                      // weekendTextStyle: TextStyle(fontSize: 20,
                       //color: Colors.white,
                      //     fontWeight: FontWeight.w600) ,
                      todayTextStyle: TextStyle
                       (
                         fontSize: 20,
                         color: Colors.white,
                         fontWeight: FontWeight.w600
                       )
                     ),
                   ),

              ),
            ],
           ),
          ),
        ),
    );
  }
}

// void main() {
//   runApp( MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// // }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState()=> _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: 
//       ),
//     );

//   }


// }


