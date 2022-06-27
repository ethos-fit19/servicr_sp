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
  });

  String? id;
  String? name;
  String? email;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(id: json["_id"], name: json["name"], email: json["email"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
      };
}
