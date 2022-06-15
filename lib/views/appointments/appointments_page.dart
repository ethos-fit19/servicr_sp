import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
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
      body:SingleChildScrollView(
          child: SizedBox(
            height: 800,
            width: 800,
            child: SfCalendar(

             // backgroundColor: Color(0xFF021E4B),
              cellBorderColor: Color(0xFF0D67F6),
                view: CalendarView.month,
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: const MonthViewSettings(
                    showAgenda: true,
                    appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
                //monthViewSettings: MonthViewSettings(showAgenda: true),
            ),
          )
      )
     );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));


    meetings.add(
        Meeting(
            'Repair pipes                                                     \Rs.2000 Per Hr', DateTime(today.year, today.month, today.day, 8, 0, 0), DateTime(today.year, today.month, today.day, 10, 30, 0), const Color(0xFF073797), false));
    meetings.add(
        Meeting(
            'Accessing Confined Spaces                         \Rs.500 Per Hr',DateTime(today.year, today.month, today.day, 11, 30, 0), DateTime(today.year, today.month, today.day, 12, 0, 0), const Color(0xFF073797), false));
    //Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false);
    meetings.add(
        Meeting(
            'Repair tanks                                                     \Rs.1300 Per Hr', DateTime(today.year, today.month, today.day, 13, 0, 0), DateTime(today.year, today.month, today.day, 14, 0, 0), const Color(0xFF073797), false));

    meetings.add(
        Meeting(
            'Repair pipes and tanks                                   \Rs700 Per Hr', DateTime(today.year, today.month, today.day, 15, 0, 0), DateTime(today.year, today.month, today.day, 16, 30, 0), const Color(0xFF073797), false));


    meetings.add(
        Meeting(
            'Repair tanks                                                    \Rs.1000 Per Hr', DateTime(today.year, today.month, 16, 8, 0, 0), DateTime(today.year, today.month, today.day, 9, 30, 0), const Color(0xFF073797), false));

    meetings.add(
        Meeting(
            'Repair pipes and tanks                                     \Rs.700 Per Hr', DateTime(today.year, 7, 23, 13, 0, 0), DateTime(today.year, today.month, today.day, 14, 30, 0), const Color(0xFF073797), false));

    meetings.add(
        Meeting(
            'Repair pipes                                                     \Rs.1028 Per Hr',  DateTime(today.year, 7, 10, 12, 0, 0), DateTime(today.year, today.month, today.day, 14, 30, 0), const Color(0xFF073797), false));
    meetings.add(
        Meeting(
            'Accessing Confined Spaces                          \Rs.550 Per Hr',DateTime(today.year,7, 7, 11, 30, 0), DateTime(today.year, today.month, today.day, 12, 0, 0), const Color(0xFF073797), false));
    //Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false);
    meetings.add(
        Meeting(
            'Repair tanks                                                     \Rs.1200 Per Hr', DateTime(today.year, 7, 10, 13, 0, 0), DateTime(today.year, today.month, today.day, 14, 0, 0), const Color(0xFF073797), false));

    return meetings;
  }
}
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}


//           child:SingleChildScrollView(
//            child: Column(
//             children: [
//               const SizedBox(height: 20,),
//               SafeArea(
//                 child: TableCalendar(
//                   firstDay: DateTime.utc(2010,10,20),
//                   lastDay: DateTime.utc(2040,10,20),
//                   focusedDay: DateTime.now(),
//                  // headerVisible: false,
//                   //daysOfWeekVisible: false,
//                  // shouldFillViewport: true,
//                  // sixWeekMonthsEnforced: true,
//                   headerStyle: const HeaderStyle(
//                       titleTextStyle: TextStyle
//                         (
//                           fontSize: 20,
//                           color: Colors.blue,
//                           fontWeight: FontWeight.w800,
//                       )
//                   ),
//                   calendarStyle: const CalendarStyle
//                     (
//                       // weekendTextStyle: TextStyle(fontSize: 20,
//                        //color: Colors.white,
//                       //     fontWeight: FontWeight.w600) ,
//                       todayTextStyle: TextStyle
//                        (
//                          fontSize: 20,
//                          color: Colors.white,
//                          fontWeight: FontWeight.w600
//                        )
//                      ),
//                    ),

//               ),
//             ],
//            ),
//           ),
//         ),
//     );
//   }
// }

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


