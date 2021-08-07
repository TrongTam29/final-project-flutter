// To parse this JSON data, do
//
//     final cardio = cardioFromJson(jsonString);

import 'dart:convert';

List<Cardio> cardioFromJson(String str) =>
    List<Cardio>.from(json.decode(str).map((x) => Cardio.fromJson(x)));

String cardioToJson(List<Cardio> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cardio {
  Cardio({
    this.id,
    this.name,
    this.link,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? link;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Cardio.fromJson(Map<String, dynamic> json) => Cardio(
        id: json["id"],
        name: json["name"],
        link: json["link"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
