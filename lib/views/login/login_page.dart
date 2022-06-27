import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:servicr_sp/models/user_model.dart';
import 'package:servicr_sp/views/register/register_page.dart';
import 'package:servicr_sp/views/home/landing.dart';
import 'package:servicr_sp/views/welcome/welcome.dart';
import '../../local.dart';
import '../../providers/currentuser_provider.dart';
import '../../util/user_provider.dart';

class LoginPage extends StatefulHookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _currentUserProvider = useProvider(currentUserProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => {Get.to(WelcomePage())},
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
              "Login",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Ionicons.mail_outline),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passController,
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
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    // primary: Colors.black,
                  ),
                  onPressed: () async {
                    final auth = UserProvider();

                    Map body = {
                      "email": emailController.text,
                      "password": passController.text
                    };
                    try {
                      var res = await auth.login(body);
                      print(res.data);
                      print('logged in');
                      // print(res.statusCode);
                      UserModel loggedUser =
                          UserModel.fromJson(res.data['user']);
                      inspect(loggedUser);
                      _currentUserProvider.state = loggedUser;

                      if (res.statusCode == 200) {
                        setState(() {
                          uid = res.data['user']['_id'];
                        });

                        Get.offAll(LandingPage());
                      } else {
                        Get.snackbar(
                          "Error",
                          "Email or password is incorrect",
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white,
                          duration: Duration(seconds: 4),
                          isDismissible: true,
                        );
                      }
                    } catch (e) {
                      // print(e);
                      Get.snackbar(
                        "Error",
                        "Something went wrong",
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                        duration: Duration(seconds: 4),
                        isDismissible: true,
                      );
                    }
                  },
                  child: const Text('Login'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
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
