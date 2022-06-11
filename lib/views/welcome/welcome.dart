import 'package:flutter/material.dart';
import 'package:servicr_sp/views/home/landing.dart';
import 'package:servicr_sp/views/login/login_page.dart';
import 'package:servicr_sp/views/register/register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                './assets/images/servicr_logo.png',
                width: 180.0,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Find service professionals near you for all your needs!',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(
                height: 24,
              ),
              Image.asset(
                './assets/images/Worker.png',
                width: 400,
              ),
              SizedBox(
                height: 24.0,
              ),
              // Text(
              //   "Login or Register",
              //   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              // ),
              // SizedBox(
              //   height: 16.0,
              // ),
              // Container(
              //   child: TextField(
              //     keyboardType: TextInputType.numberWithOptions(),
              //     decoration: InputDecoration(
              //         labelText: "Mobile Number",
              //         enabledBorder: OutlineInputBorder()),
              //   ),
              // ),
              // SizedBox(
              //   height: 16.0,
              // ),
              // ElevatedButton(
              //   child: Text('Continue'),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => LandingPage(),
              //       ),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: const Size.fromHeight(50),

              //     //   primary: Colors.black,
              //   ),
              // ),
              ElevatedButton(
                child: Text('Log in'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  //   primary: Colors.black,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              OutlinedButton(
                child: Text('Register'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  primary: Colors.black,
                  //   side: BorderSide(color: Color(0xff000000)),
                ),
              ),
            ],
          ),
        ));
  }
}
