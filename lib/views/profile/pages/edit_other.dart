import 'package:flutter/material.dart';
import 'package:servicr_sp/views/profile/user/user_data.dart';
import 'package:servicr_sp/views/profile/widgets/appbar_widget.dart';

// This class handles the Page to edit the other Section of the User Profile.
class EditOtherFormPage extends StatefulWidget {
  @override
  _EditOtherFormPageState createState() => _EditOtherFormPageState();
}

class _EditOtherFormPageState extends State<EditOtherFormPage> {
  final _formKey = GlobalKey<FormState>();
  final OtherController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    OtherController.dispose();
    super.dispose();
  }

  void updateUserValue(String Other) {
    user.other = Other;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 350,
                    child: const Text(
                      "Other",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length > 300) {
                              return 'Add if you want say something about yourself';
                            }
                            return null;
                          },
                          controller: OtherController,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 15, 10, 100),
                              hintMaxLines: 3,
                              hintText: 'Tell something'),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                updateUserValue(OtherController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}
