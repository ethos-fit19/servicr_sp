import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:servicr_sp/views/login/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../home/landing.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();

    void _registration() {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        Get.snackbar(
          "Error",
          "Enter your name",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
        );
      } else if (email.isEmpty) {
        Get.snackbar(
          "Error",
          "Enter your email",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
        );
      } else if (!GetUtils.isEmail(email)) {
        Get.snackbar(
          "Error",
          "Email not valid",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
        );
      } else if (password.isEmpty) {
        Get.snackbar(
          "Error",
          "Enter your password",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
        );
      } else if (password.length < 6) {
        Get.snackbar(
          "Error",
          "Password less than 6 characters",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
        );
      } else {
        Get.snackbar(
          "Success",
          "Check email for verification",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
        );
      }
    }

    return Scaffold(
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
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Ionicons.person_outline),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Ionicons.mail_outline),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: passwordController,
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
                  onPressed: () => _registration(),
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
