import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:servicr_sp/local.dart';

import '../../constants.dart';

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List appointments = [];
  List notifications = [];

  GetNotificationForSP() async {
    var response = await Dio().get("$apiUrl/appointments");
    // print(response.data);
    Map<String, dynamic> responseJSON = await json.decode(response.toString());
    appointments = responseJSON['data'];

    appointments.forEach((element) {
      if (element['serviceProvider'] == null) {
      } else {
        (element['serviceProvider']['serviceProviderID'] == uid &&
                element['serviceisAcceptedStatus'] == false)
            ? {notifications.add(element), print(element)}
            : '';
      }
    });
    print("n:  " + notifications.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetNotificationForSP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifications"),
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: const Icon(Icons.refresh))
        ],
      ),
      body: listView(notifications, context),
    );
  }
}

PreferredSizeWidget appBar() {
  return AppBar(
    title: Text("Notification Screen"),
  );
}

Widget listView(List notifications, context) {
  print(notifications.length.toString() + ' long');
  return ListView.separated(
      itemBuilder: (contex, index) {
        return ListViewItem(notifications[index], index, contex);
      },
      separatorBuilder: (contex, index) {
        return Divider(height: 0);
      },
      itemCount: notifications.length);
}

Widget ListViewItem(var item, int index, context) {
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(item, index),
                  acceptButton(item, context),
                  timeAndDate(item),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Row acceptButton(var ele, context) {
  Future putAcceptAppointment(Map element) async {
    String id = element['_id'];
    element.remove('_id');
    element['id'] = id;

    element['serviceisAcceptedStatus'] = true;
    // element['serviceAcceptedStatus'] = true;

    // Map<String, dynamic> data = {"??d": id., "serviceisAcceptedStatus": true};

    var data = json.encode(element);

    var response = await Dio().put("$apiUrl/appointments", data: data);
  }

  return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    Padding(
        padding: const EdgeInsets.only(right: 20),
        child: GestureDetector(
          onTap: () {
            putAcceptAppointment(ele);
          },
          child: Text('Accept',
              style: TextStyle(color: Colors.green, fontSize: 20)),
        )),
  ]);
}

Widget prefixIcon() {
  return Container(
    height: 50,
    width: 50,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.shade300,
    ),
    child: Icon(
      Icons.notifications,
      size: 25,
      color: Colors.grey.shade700,
    ),
  );
}

Widget message(var item, int index) {
  double textSize = 14;
  return Container(
    child: RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: item['client']['name'],
          style: TextStyle(
              fontSize: textSize,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: ' ' + item['address'],
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            )
          ]),
    ),
  );
}

Widget timeAndDate(var item) {
  String date = item['date'];
  String price = item['price'].toString();
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date.substring(0, 9),
          style: TextStyle(
            fontSize: 10,
          ),
        ),
        Text(
          'for ' + price,
          style: TextStyle(
            fontSize: 10,
          ),
        )
      ],
    ),
  );
}
