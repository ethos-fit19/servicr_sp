import 'package:flutter/material.dart';
//import 'package:servicr_sp/views/home/landing.dart';
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
                'assets/images/servicr_logo.png',
                width: 180.0,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Provide home services and earn money!',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(
                height: 24,
              ),
              Image.asset(
                'assets/images/sp_welcome.jpg',
                width: 400,
              ),
              SizedBox(
                height: 24.0,
              ),
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
