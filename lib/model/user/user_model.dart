// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;

  String? email;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}

class UserComment {
  UserComment({
    this.name,
    this.image,
    this.comment,
  });

  String? name;
  String? image;
  String? comment;

  factory UserComment.fromJson(Map<String, dynamic> json) => UserComment(
        name: json["name"],
        image: json["image"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "comment": comment,
      };
}
