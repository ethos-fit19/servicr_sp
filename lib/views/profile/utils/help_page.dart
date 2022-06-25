import 'package:flutter/material.dart';
// import 'package:servicr_client/views/utils/aboutUI.dart';
// import 'package:fluttertoast/fluttertoast.dart';

//import 'package:info/aboutUI.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Colors.cyan,
//       ),
//       home: MyApp(),
//     ));

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
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        //padding: const EdgeInsets.all(10),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMEpUpzx7b1_ZgqmyVy-oqcOuvdWYQmu6h5w&usqp=CAU'),
            ),
          ],
        ),
      ),
    );
    // ignore: dead_code
    // body:
    // Container(
    //     alignment: Alignment.center,
    //     padding: EdgeInsets.all(32),
    //     child: ElevatedButton(
    //       style: ElevatedButton.styleFrom(
    //         minimumSize: Size(280, 80),
    //       ),
    //       child: Text('Elevated Button'),
    //       onPressed: () => Fluttertoast.showToast(
    //         msg: 'Pressed Elevated Button',
    //         fontSize: 18,
    //       ),
    //     ));
  }
}

@override
Widget build(BuildContext context) {
  //return Scaffold(
  return Column(
    children: <Widget>[
      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () {},
        child: const Text('TextButton'),
      ),
    ],
  );
}
