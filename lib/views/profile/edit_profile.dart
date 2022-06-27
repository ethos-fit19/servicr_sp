// import 'package:flutter/material.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:get/get.dart';
// import 'package:servicr_sp/views/home/home_page.dart';

// class ProfileEditPage extends StatefulWidget {
//   const ProfileEditPage({Key? key}) : super(key: key);

//   @override
//   State<ProfileEditPage> createState() => _ProfileEditPageState();
// }

// class _ProfileEditPageState extends State<ProfileEditPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Edit Profile"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 const TextField(
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     prefixIcon: Icon(Ionicons.mail_outline),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const TextField(
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     prefixIcon: Icon(Ionicons.lock_closed_outline),
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 ElevatedButton(
//                   child: const Text('Login'),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                     // primary: Colors.black,
//                   ),
//                   onPressed: () => {},
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Dont have an account? "),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HomePage(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Register",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
