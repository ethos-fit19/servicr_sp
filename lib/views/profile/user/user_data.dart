import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    image:
        "https://media.istockphoto.com/photos/work-that-dirt-save-the-earth-picture-id690299268?b=1&k=20&m=690299268&s=170667a&w=0&h=mI7JkggCc-YdXJMDq6C1ZwPowgRyceXN8GqoJBGnvu8=",
    name: 'John Philip',
    email: 'johnphilip89@gmail.com',
    phone: '+94256984320',
    location: 'Kandy',
    other: '',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
