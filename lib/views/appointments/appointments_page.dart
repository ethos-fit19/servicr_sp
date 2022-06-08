import 'package:flutter/material.dart';

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
      body: Text("Appointments"),
    );
  }
}
