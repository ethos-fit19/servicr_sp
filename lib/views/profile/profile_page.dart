// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:servicr_sp/views/profile/pages/edit_profile_page.dart';
import 'package:servicr_sp/views/profile/utils/about_page.dart';
import 'package:servicr_sp/views/profile/utils/help_page.dart';
import 'package:servicr_sp/views/profile/utils/setting_page.dart';
import '../../providers/currentuser_provider.dart';
import '../../util/user_provider.dart';

class ProfilePage extends HookWidget {
  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _currentUserProvider = useProvider(currentUserProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
        ),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          //image: NetworkImage(
                          //     'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
                          image: AssetImage('assets/images/boy.png'),
                        ),
                      ),
                    ),
                    Text(
                      _currentUserProvider.state.name!,
                      // 'John smith',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // 'johnsmith93@gmail.com',
                      _currentUserProvider.state.email!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Kandy',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 270,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => SettingPageUI()),
                    //     );
                    //   },
                    //   child: TextField(
                    //     enabled: false,
                    //     decoration: InputDecoration(
                    //       prefixIcon: Icon(
                    //         Icons.settings,
                    //         color: Colors.blueGrey,
                    //         size: 30,
                    //       ),
                    //       labelText: "Settings",
                    //       suffixIcon: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.blueGrey,
                    //       ),
                    //       enabledBorder: const OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(20.0)),
                    //         borderSide: BorderSide(
                    //           color: Colors.blueAccent,
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(10.0)),
                    //         borderSide: BorderSide(color: Colors.blue),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutPageUI()),
                        );
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.info_outline,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                          labelText: "ABOUT US",
                          suffixIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpPageUI()),
                        );
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.help_outline_rounded,
                            color: Colors.blueGrey,
                            size: 30,
                          ),
                          labelText: "HELP & SUPPORT",
                          suffixIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),

                     InkWell(
                       onTap:() async {
                        await FlutterShare.share(
                            title: "Servicr",
                            text: "Servicr - Your all home demand servicers connecting place",
                            linkUrl:
                                "https://pub.dev/packages/url_launcher#android");
                      },

                    child:TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.share,
                          color: Colors.blueGrey,
                          size: 30,
                        ),
                        labelText: "SHARE",
                        suffixIcon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                     ),

                  ],

                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    // primary: Colors.black,
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    )
                  },
                  child: const Text('Edit Profile'),
                ),
              ),
              Container(
                //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    // primary: Colors.black,
                  ),
                  onPressed: () {
                    final obj = UserProvider();

                    obj.logout(context);
                  },
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
