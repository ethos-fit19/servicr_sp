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

    setState(() {
      appointments = responseJSON['data'];
    });

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
    print('init');
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
      ),
      body: listView(notifications),
    );
  }
}

PreferredSizeWidget appBar() {
  return AppBar(
    title: Text("Notification Screen"),
  );
}

Widget listView(List notifications) {
  print(notifications.length.toString() + ' long');
  return ListView.separated(
      itemBuilder: (contex, index) {
        return ListViewItem(notifications[index], index);
      },
      separatorBuilder: (contex, index) {
        return Divider(height: 0);
      },
      itemCount: notifications.length);
}

Widget ListViewItem(var item, int index) {
  return Container(
    margin: EdgeInsets.only(left: 10),
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
                timeAndDate(item),
              ],
            ),
          ),
        ),
      ],
    ),
  );
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
              text: item['address'],
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
