import 'dart:math';

import 'package:flutter/material.dart';
import '../home/theme.dart';
import '../../constants.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '';


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
          title: Text("Home SP"),
        ),
        body: const DashboardScreen(),
        );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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

     _onItemTapped(int index){
       setState((){
         _selectedIndex=index;
       });
     }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          Padding(
              padding: EdgeInsets.all(8),
          child: Center(
            child: CircleAvatar(
              maxRadius: 20,
              backgroundImage: NetworkImage("https://jooinn.com/images/man39s-face-11.jpg"),
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
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width / 2 - 20,
                        child: Column(
                          children: [
                            CustomPaint(
                              foregroundPainter: CircleProgress(),
                              child: SizedBox(
                                width: 107,
                                height: 107,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "January",
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
                                        const Icon(
                                          Icons.arrow_upward_outlined,
                                          color: Colors.blue,
                                          size: 14,
                                        ),
                                        Text(
                                          "40%",
                                          style: textSemiBold,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                            Text(
                              "NEW ACHIEVMENT",
                              style: textBold2,
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
                                image: AssetImage("./assets/images/427.jpg"))),
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
                                  style: TextStyle(fontWeight: FontWeight.bold)
                              )
                            ]
                        ),
                      ),

                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 0,
                            mRight: 3,
                            child: const ListTileCustom(
                              bgColor:Color(0xFFF7E3FF),
                              //pathIcon: ".assets/icons/line.svg",
                              pathIcon:"line.svg",
                              title: "Profit Against Last Month",
                              subTitle: "\$3.3",
                            ),
                          ),
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 3,
                            mRight: 0,
                            child: const ListTileCustom(
                              bgColor: Colors.lightGreenAccent,
                              pathIcon: "salary-svgrepo-com.svg",
                              title: "Monthly Income",
                              subTitle: "\$43.3",
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
                            child: const ListTileCustom(
                              bgColor: Color(0xFFFFF7DF),
                              pathIcon: "starts.svg",
                              title: "Reviews",
                              subTitle: "+10",
                            ),
                          ),
                          CardCustom(
                            width: size.width / 2 - 23,
                            height: 88.9,
                            mLeft: 3,
                            mRight: 0,
                            child: const ListTileCustom(
                              bgColor: Color(0xFFDEF7FF),
                              pathIcon: "eyes.svg",
                              title: "Total Customers",
                              subTitle: "8",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10.71,
                                      height: 10.71,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF0B45DC)
                                      ),
                                    ),
                                    const Padding(

                                      padding: EdgeInsets.only(right: 5),
                                      child: Text(" Peak Point: \$20.009",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black
                                       ),
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
                                )
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                width: double.infinity,
                                height: 300,
                                //color: Colors.blue,
                                child: LineChart(
                                  LineChartData(
                                      borderData: FlBorderData(show: false),
                                      lineBarsData: [
                                       LineChartBarData(spots: [
                                         //DATA
                                        const FlSpot(0, 1),
                                        const FlSpot(1, 3),
                                        const FlSpot(2, 10.56),
                                        const FlSpot(3, 7.3),
                                        const FlSpot(4, 12),
                                        const FlSpot(5, 2.98),
                                        const FlSpot(6, 17),
                                        const FlSpot(7, 15.88),
                                        const FlSpot(8, 13),
                                         const FlSpot(9,12),
                                         const FlSpot(10,20)
                                      ]
                                       ),
                                  ]),
                                ),
                              ),

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
                          )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


        ),
      ),

    );
  }

  void setState(Null Function() param0) {}
}

class CardCustom extends StatelessWidget{
  final double mLeft, mRight, width, height;
  final Widget child;

  const CardCustom({
    Key? key,
    required this.mLeft,
    required this.mRight,
    required this.width,
    required this.height,
    required this.child
  }) : super(key: key);

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
          borderRadius:  BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFA3014F).withOpacity(0.05),
              offset: const Offset(0,9),
              blurRadius: 30,
              spreadRadius: 0,
            ),
            BoxShadow(
                color: const Color(0xFFB2036C).withOpacity(0.03),
                offset: const Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 0
            )
          ]
      ),
      child: child,
    );
  }

}
class CircleProgress extends CustomPainter {

  CircleProgress();

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

    Offset center = Offset(size.width/2 , size.height/2);
    double radius = min(size.width/2, size.height/2 )-7;

    canvas.drawCircle(center, radius, outerCircle);
    double angle = 2 * pi * ( 40/100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, angle, false, completeArc);


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
    required this.pathIcon, required this.title,
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
      title: Text(title,
        style: textBold2,
      ),
      subtitle: Text(subTitle,
        style: textBold,
      ),
    );
  }
}
