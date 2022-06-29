import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:servicr_sp/views/profile/user/user_data.dart';
import 'package:servicr_sp/views/profile/widgets/appbar_widget.dart';
import 'package:string_validator/string_validator.dart';

import '../../../providers/currentuser_provider.dart';
import '../../../util/user_provider.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulHookWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserValue(String name) async {
    final auth = UserProvider();
    user.name = name;

    // API call.
    try {
      Map body = {
        "name": name,
      };
      var res = await auth.updateUser(
          body, context.read(currentUserProvider).state.id!);
      print(res.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _currentUserProvider = useProvider(currentUserProvider);
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  width: 330,
                  child: const Text(
                    "What's Your Name?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for First Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              } else if (!isAlpha(value)) {
                                return 'Only Letters Please';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(labelText: 'First Name'),
                            controller: firstNameController,
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for Last Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              } else if (!isAlpha(value)) {
                                return 'Only Letters Please';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Last Name'),
                            controller: secondNameController,
                          )))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate() &&
                                isAlpha(firstNameController.text +
                                    secondNameController.text)) {
                              updateUserValue(firstNameController.text +
                                  " " +
                                  secondNameController.text);
                              _currentUserProvider.state.name =
                                  firstNameController.text +
                                      " " +
                                      secondNameController.text;
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
            ],
          ),
        ));
  }
}






//.................................................................................







// import 'package:flutter/material.dart';
// import 'package:servicr_sp/views/profile/user/user_data.dart';
// import 'package:servicr_sp/views/profile/widgets/appbar_widget.dart';
// import 'package:string_validator/string_validator.dart';

// // This class handles the Page to edit the Name Section of the User Profile.
// class EditNameFormPage extends StatefulWidget {
//   const EditNameFormPage({Key? key}) : super(key: key);

//   @override
//   EditNameFormPageState createState() {
//     return EditNameFormPageState();
//   }
// }

// class EditNameFormPageState extends State<EditNameFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final firstNameController = TextEditingController();
//   final secondNameController = TextEditingController();
//   var user = UserData.myUser;

//   @override
//   void dispose() {
//     firstNameController.dispose();
//     super.dispose();
//   }

//   void updateUserValue(String name) {
//     user.name = name;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: buildAppBar(context),
//         body: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                   width: 330,
//                   child: const Text(
//                     "What's Your Name?",
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                       padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
//                       child: SizedBox(
//                           height: 100,
//                           width: 150,
//                           child: TextFormField(
//                             // Handles Form Validation for First Name
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your first name';
//                               } else if (!isAlpha(value)) {
//                                 return 'Only Letters Please';
//                               }
//                               return null;
//                             },
//                             decoration:
//                                 InputDecoration(labelText: 'First Name'),
//                             controller: firstNameController,
//                           ))),
//                   Padding(
//                       padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
//                       child: SizedBox(
//                           height: 100,
//                           width: 150,
//                           child: TextFormField(
//                             // Handles Form Validation for Last Name
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your last name';
//                               } else if (!isAlpha(value)) {
//                                 return 'Only Letters Please';
//                               }
//                               return null;
//                             },
//                             decoration:
//                                 const InputDecoration(labelText: 'Last Name'),
//                             controller: secondNameController,
//                           )))
//                 ],
//               ),
//               Padding(
//                   padding: EdgeInsets.only(top: 150),
//                   child: Align(
//                       alignment: Alignment.bottomCenter,
//                       child: SizedBox(
//                         width: 330,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Validate returns true if the form is valid, or false otherwise.
//                             if (_formKey.currentState!.validate() &&
//                                 isAlpha(firstNameController.text +
//                                     secondNameController.text)) {
//                               updateUserValue(firstNameController.text +
//                                   " " +
//                                   secondNameController.text);
//                               Navigator.pop(context);
//                             }
//                           },
//                           child: const Text(
//                             'Update',
//                             style: TextStyle(fontSize: 15),
//                           ),
//                         ),
//                       )))
//             ],
//           ),
//         ));
//   }
// }
