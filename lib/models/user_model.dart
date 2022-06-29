// To parse this JSON data, do
//
//     final UserModel = loginModelFromJson(jsonString);

import 'dart:convert';

UserModel loginModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String loginModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.city,
  });

  String? id;
  String? name;
  String? email;
  String? city = 'kandy';

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      city: json["city"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "city": city,
      };
}
