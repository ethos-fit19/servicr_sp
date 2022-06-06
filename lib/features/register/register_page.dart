import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:servicr_sp/features/login/login_page.dart';
import 'package:get/get.dart';

import '../../landing.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Register",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Ionicons.person_outline),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Ionicons.mail_outline),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Ionicons.lock_closed_outline),
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  child: const Text('Register'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    // primary: Colors.black,
                  ),
                  onPressed: () => {Get.to(LandingPage())},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
