import 'package:flutter/material.dart';
import 'package:servicr_sp/views/profile/user/user_data.dart';
import 'package:servicr_sp/views/profile/widgets/appbar_widget.dart';

// This class handles the Page to edit the location  Section of the User Profile.
class EditLocationFormPage extends StatefulWidget {
  @override
  _EditLocationFormPageState createState() => _EditLocationFormPageState();
}

class _EditLocationFormPageState extends State<EditLocationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final locationController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  void updateUserValue(String location) {
    user.location = location;
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
                      "Where are you from",
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
                                value.length > 200) {
                              return 'Enter your most prefer location';
                            }
                            return null;
                          },
                          controller: locationController,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 15, 10, 100),
                              hintMaxLines: 3,
                              hintText: 'Enter your current location'),
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
                                updateUserValue(locationController.text);
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
