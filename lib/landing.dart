import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:servicr_sp/features/appointments/appointments_page.dart';
import 'package:servicr_sp/features/home/home_page.dart';
import 'package:servicr_sp/features/notifications/notifications_page.dart';
import 'package:servicr_sp/features/profile/profile_page.dart';
import 'package:servicr_sp/util/colors.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    AppointmentsPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: AppColor.s_blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.home_outline,
            ),
            activeIcon: Icon(Ionicons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.calendar_outline),
            activeIcon: Icon(Ionicons.calendar_sharp),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.notifications_outline),
            activeIcon: Icon(Ionicons.notifications_sharp),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            activeIcon: Icon(Ionicons.person_sharp),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
