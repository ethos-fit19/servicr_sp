import 'package:flutter/material.dart';
import 'package:servicr_sp/views/profile/profile_page.dart';
import 'package:servicr_sp/views/profile/utils/aboutUI.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:servicr_sp/views/profile/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

//import 'package:info/aboutUI.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(

//         brightness: Brightness.light,
//         primaryColor: Colors.cyan,
//       ),
//       home: MyApp(),
//     ));

final Uri phoneUrl = Uri(scheme: "tel", path: '+94775964727');

class HelpPageUI extends StatefulWidget {
  // const HelpPageUI({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  State<HelpPageUI> createState() => _HelpPageUIState();
}

class _HelpPageUIState extends State<HelpPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help and support",
            style: TextStyle(
              fontSize: 22,
            )),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        //padding: const EdgeInsets.all(10),
        // child: Stack(
        //   clipBehavior: Clip.none,
        //   alignment: Alignment.center,
        //   children: <Widget>[
        //     Image(
        //       width: double.infinity,
        //       height: MediaQuery.of(context).size.height / 3,
        //       fit: BoxFit.cover,
        //       image: NetworkImage(
        //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMEpUpzx7b1_ZgqmyVy-oqcOuvdWYQmu6h5w&usqp=CAU'),
        //     ),

        //   ],
        // ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Image(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMEpUpzx7b1_ZgqmyVy-oqcOuvdWYQmu6h5w&usqp=CAU'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    style: TextButton.styleFrom(
                        
                        padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                        // minimumSize: const Size.fromWidth(80),

                        textStyle:
                            TextStyle(color: Color.fromARGB(255, 59, 136, 212)),
                        backgroundColor: Colors.blue[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      launch("tel://+94775964727");
                    },
                    icon: Icon(Icons.phone),
                    label: Text("Call Us")),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                        //minimumSize: const Size.fromHeight(80),
                        textStyle:
                            TextStyle(color: Color.fromARGB(255, 59, 136, 212)),
                        backgroundColor: Colors.blue[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      var mail = "ubhanuka@gmail.com";
                      var subject = "";
                      var body = "";

                      await launch("mailto:$mail?subject=$subject&body=$body");
                    },
                    icon: Icon(Icons.mail),
                    label: Text("Mail to Us")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
