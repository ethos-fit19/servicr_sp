import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../local.dart';
import '../home/theme.dart';
import '../../constants.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
      ),
      body: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String currentMonth = DateTime.now().toString().substring(5, 7);
  String currentYear = DateTime.now().toString().substring(0, 4);
  String MonthName = DateFormat("MMMM").format(DateTime.now());

  List appointments = [];
  List acceptedAppointments = [];
  List reviews = [];
  String sid = '';

  Future getSPidByyUserId(uid) async {
    var response = await Dio().get(apiUrl + '/serviceProvider');
    Map<String, dynamic> responseJSON = await json.decode(response.toString());
    List sp = responseJSON['data'];
    print(sp);
    for (var element in sp) {
      (element['serviceProviderID']['_id'].toString() == uid)
          ? {
              setState(
                () {
                  sid = element['_id'].toString();
                },
              )
            }
          : '';
    }
  }

  setSID() async {
    await getSPidByyUserId(uid);

    await GetAppointmentsOfSP(sid);
  }

  Future GetAppointmentsOfSP(sid) async {
    print("URL:  " + apiUrl + '/appointments/servicer/' + sid);
    var res = await Dio().get(apiUrl + '/appointments/servicer/' + sid);
    Map<String, dynamic> responseJSON = await json.decode(res.toString());

    setState(() {
      appointments = responseJSON['data'];
    });

    appointments.forEach(
      (element) {
        setState(() {
          element['serviceisAcceptedStatus'] == true
              ? acceptedAppointments.add(element)
              : '';
        });
      },
    );

    print('??ccepted' + acceptedAppointments.toString());

    setState(() {
      totalThisMonth = totalIncomePerMonth(currentMonth, currentYear);
      totalLastMonth = lastMonthIncome();
    });
  }

  int totalIncomePerMonth(var month, var yr) {
    int total = 0;
    print('month $month yr $yr');
    acceptedAppointments.forEach((element) {
      String mon = element['date'].toString().substring(5, 7);
      String year = element['date'].toString().substring(0, 4);
      print(element['price']);
      (int.parse(mon) == int.parse(month) && int.parse(yr) == int.parse(year))
          ? total += element['price'] as int
          : 0;
    });
    print('total $total');

    return total;
  }

  int lastMonthIncome() {
    int lastMonth = (currentMonth == '1') ? 12 : (int.parse(currentMonth) - 1);
    int year = currentMonth == '1'
        ? int.parse(currentYear) - 1
        : int.parse(currentYear);

    return totalIncomePerMonth(lastMonth.toString(), year.toString());
  }

  int customersPerMonth(var month) {
    int customers = 0;
    acceptedAppointments.forEach((element) {
      String mon = element['date'].toString().substring(5, 7);
      String year = element['date'].toString().substring(0, 4);
      customers += (int.parse(mon) == int.parse(month) &&
              int.parse(currentYear) == int.parse(year))
          ? 1
          : 0;
    });
    return customers;
  }

  getReviews() async {
    try {
      var response = await Dio().get('$apiUrl/reviews');
      Map<String, dynamic> responseJSON =
          await json.decode(response.toString());

      setState(() {
        reviews = responseJSON['data'];
      });

      print('res: $responseJSON');
    } catch (e) {
      print(e);
    }
  }

  List newReviewsInMonth() {
    List res = [];
    var total = 0;
    var monthly = 0;
    reviews.forEach((element) {
      element['servicer'].contains(uid) ? {res.add(element), total += 1} : '';
    });
    res.forEach((ele) {
      ele['addedOn'].toString().substring(5, 7) == currentMonth
          ? monthly += 1
          : '';
    });
    return [monthly, total];
  }

  percentage() {
    return (((totalThisMonth - totalLastMonth) / totalLastMonth) * 100)
        .roundToDouble();
  }

  int totalThisMonth = 0;
  int totalLastMonth = 0;

  @override
  void initState() {
    super.initState();
    setSID();

    getReviews();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _selectedIndex = 0;
    // const List<Widget> _widgetOptions = <Widget>[
    //   // Text('Home Page',
    //   //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    //   // Text('Appoiments Page',
    //   //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    //   // Text('Notification Page',
    //   //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    //   // Text('Profile Page',
    //   //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    // ];

    _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return acceptedAppointments.toList().length > 0
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: CircleAvatar(
                      maxRadius: 20,
                      backgroundImage: NetworkImage(
                          "https://jooinn.com/images/man39s-face-11.jpg"),
                    ),
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width / 2 - 20,
                              child: Column(
                                children: [
                                  CustomPaint(
                                    foregroundPainter: CircleProgress(
                                        ((totalThisMonth - totalLastMonth) /
                                            totalLastMonth)),
                                    child: SizedBox(
                                      width: 107,
                                      height: 107,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            MonthName.toUpperCase(),
                                            style: textSemiBold,
                                          ),
                                          Text(
                                            "PROFIT",
                                            style: textSemiBold,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ((totalThisMonth -
                                                              totalLastMonth) /
                                                          totalLastMonth) >
                                                      0
                                                  ? const Icon(
                                                      Icons
                                                          .arrow_upward_outlined,
                                                      color: Colors.blue,
                                                      size: 14,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .arrow_downward_outlined,
                                                      color: Colors.red,
                                                      size: 14,
                                                    ),
                                              Text(
                                                '0',
                                                style: textSemiBold,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  totalThisMonth > 0
                                      ? Text(
                                          "NEW ACHIEVMENT",
                                          style: textBold2,
                                        )
                                      : Text(
                                          "NO",
                                          style: textBold3,
                                        ),
                                  Text(
                                    "PROFIT !!",
                                    style: textBold3,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width / 2 - 20,
                              height: 180,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "./assets/images/427.jpg"))),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 6,
                        color: const Color(0xFFF5F4F4),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Key metrics",
                                  style: GoogleFonts.montserrat().copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: const Color(0xFF4F3A57),
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: " this month",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CardCustom(
                                  width: size.width / 2 - 23,
                                  height: 100,
                                  mLeft: 0,
                                  mRight: 3,
                                  child: ListTileCustom(
                                      bgColor: Color(0xFFF7E3FF),
                                      //pathIcon: ".assets/icons/line.svg",
                                      pathIcon: "I1.png",
                                      title: "Profit Against Last Month",
                                      subTitle: 'Rs ' +
                                          (totalThisMonth - totalLastMonth)
                                              .toString()),
                                ),
                                CardCustom(
                                  width: size.width / 2 - 23,
                                  height: 100,
                                  mLeft: 3,
                                  mRight: 0,
                                  child: ListTileCustom(
                                    bgColor: Colors.lightGreenAccent,
                                    pathIcon: "salary-svgrepo-com.svg",
                                    title: "Monthly Income",
                                    subTitle: 'Rs ${totalThisMonth}',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CardCustom(
                                  width: size.width / 2 - 23,
                                  height: 88.9,
                                  mLeft: 0,
                                  mRight: 3,
                                  child: ListTileCustom(
                                    bgColor: Color(0xFFFFF7DF),
                                    pathIcon: "starts.svg",
                                    title: "Reviews",
                                    subTitle:
                                        newReviewsInMonth()[0].toString() +
                                            '/' +
                                            newReviewsInMonth()[1].toString(),
                                  ),
                                ),
                                CardCustom(
                                  width: size.width / 2 - 23,
                                  height: 88.9,
                                  mLeft: 3,
                                  mRight: 0,
                                  child: ListTileCustom(
                                    bgColor: Color(0xFFDEF7FF),
                                    pathIcon: "eyes.svg",
                                    title: "Total Customers",
                                    subTitle: customersPerMonth(currentMonth)
                                        .toString(),
                                  ),
                                ),
                              ],
                            ),
                            CardCustom(
                                mLeft: 0,
                                mRight: 0,
                                width: size.width - 40,
                                height: 400,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 10.71,
                                              height: 10.71,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF0B45DC)),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: Text(
                                                " Peak Point: " +
                                                    (totalLastMonth <
                                                            totalThisMonth
                                                        ? totalThisMonth
                                                            .toString()
                                                        : totalLastMonth
                                                            .toString()),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                            ),

                                            // const SizedBox(
                                            //   width: 6,
                                            // ),
                                            // Text("Earnings",
                                            //   style: label,
                                            // ),
                                            // const SizedBox(
                                            //   width: 12,
                                            // ),
                                            // Container(
                                            //   width: 9.71,
                                            //   height: 9.71,
                                            //   decoration: const BoxDecoration(
                                            //       shape: BoxShape.circle,
                                            //       color: Colors.teal
                                            //   ),
                                            // ),
                                            // const SizedBox(
                                            //   width: 6,
                                            // ),
                                            // Text("Profit Rate",
                                            //   style: label,
                                            // ),
                                            // const SizedBox(
                                            //   width: 12,
                                            // ),
                                            // Container(
                                            //   width: 9.71,
                                            //   height: 9.71,
                                            //   decoration: BoxDecoration(
                                            //       shape: BoxShape.circle,
                                            //       color: red
                                            //   ),
                                            // ),
                                            // const SizedBox(
                                            //   width: 6,
                                            // ),
                                            // Text("Peak Points",
                                            //   style: label,
                                            // ),

                                            // const SizedBox(
                                            //   width: 12,
                                            // ),
                                          ],
                                        )),
                                    Container(
                                        padding: const EdgeInsets.all(2),
                                        width: double.infinity,
                                        height: 300,
                                        //color: Colors.blue,
                                        child: totalThisMonth > 0
                                            ? LineChart(
                                                LineChartData(
                                                    borderData: FlBorderData(
                                                        show: false),
                                                    lineBarsData: [
                                                      LineChartBarData(spots: [
                                                        //DATA
                                                        FlSpot(
                                                            1,
                                                            totalThisMonth
                                                                .toDouble()),
                                                        FlSpot(
                                                            0,
                                                            totalLastMonth
                                                                .toDouble()),
                                                      ]),
                                                    ]),
                                              )
                                            : Container()),

                                    // Container(
                                    //   width: size.width - 40,
                                    //   height: 144.35,
                                    //   decoration: const BoxDecoration(
                                    //       borderRadius: BorderRadius.only(
                                    //         bottomLeft: Radius.circular(15),
                                    //         bottomRight: Radius.circular(15),
                                    //       ),
                                    //       image: DecorationImage(
                                    //           image: AssetImage(
                                    //               "assets/images/graph.png"),
                                    //           fit: BoxFit.fill
                                    //       )
                                    //   ),
                                    //
                                    // )

                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 20,right:20 ),
                                    //   child: Container(
                                    //     //width: double.infinity,
                                    //     height: 100,
                                    //     decoration: BoxDecoration(
                                    //       color:Colors.white,
                                    //       borderRadius:BorderRadius.circular(12),
                                    //       boxShadow: [
                                    //         BoxShadow(
                                    //           color: Colors.grey.withOpacity(0.01),
                                    //           spreadRadius: 10,
                                    //           blurRadius: 3
                                    //         )
                                    //       ]
                                    //     ),
                                    //     child:Padding(
                                    //       padding: const EdgeInsets.all(0),
                                    //       child: Stack(
                                    //         children: [
                                    //           Padding(
                                    //             padding: const EdgeInsets.only(bottom: 0),
                                    //             child: Column(
                                    //               crossAxisAlignment: CrossAxisAlignment.start,
                                    //               children: const [
                                    //                 // Text("Net Blance",style: TextStyle(
                                    //                 //   fontWeight: FontWeight.w500,
                                    //                 //   fontSize: 13,
                                    //                 //   color: Colors.grey
                                    //                 // ),),
                                    //
                                    //                 SizedBox(
                                    //                   height: 10,
                                    //                 ),
                                    //                 Text("\$23.90",style: TextStyle(
                                    //                     fontWeight: FontWeight.bold,
                                    //                     fontSize: 24,
                                    //                     color: Colors.grey
                                    //                 ),),
                                    //               ],
                                    //
                                    //             ),
                                    //           ),
                                    //           Container(
                                    //
                                    //           )
                                    //         ],
                                    //
                                    //       ),
                                    //     ),
                                    //
                                    //   ),
                                    // )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

class CardCustom extends StatelessWidget {
  final double mLeft, mRight, width, height;
  final Widget child;

  const CardCustom(
      {Key? key,
      required this.mLeft,
      required this.mRight,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(mLeft, 3, mRight, 3),
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA3014F).withOpacity(0.05),
              offset: const Offset(0, 9),
              blurRadius: 30,
              spreadRadius: 0,
            ),
            BoxShadow(
                color: const Color(0xFFB2036C).withOpacity(0.03),
                offset: const Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0)
          ]),
      child: child,
    );
  }
}

class CircleProgress extends CustomPainter {
  double progress;
  CircleProgress(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = 5
      ..color = const Color(0xFFE7E7E7)
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 5
      ..color = const Color(0xFF1348D0)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 7;

    canvas.drawCircle(center, radius, outerCircle);
    double angle = 2 * pi * (progress);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ListTileCustom extends StatelessWidget {
  final Color bgColor;
  final String pathIcon, title, subTitle;
  const ListTileCustom({
    Key? key,
    required this.bgColor,
    required this.pathIcon,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        // child: SvgPicture.asset("assets/icons/"+pathIcon,
        //   width: 21.88,
        //   height: 10.94,
        //   fit: BoxFit.scaleDown,
        // ),
      ),
      title: Text(
        title,
        style: textBold2,
      ),
      subtitle: Text(
        subTitle,
        style: textBold,
      ),
    );
  }
}
