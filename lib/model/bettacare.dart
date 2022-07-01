
import 'dart:convert';

Bettacare bettacareFromJson(String str) => Bettacare.fromJson(json.decode(str));

String bettacareToJson(Bettacare data) => json.encode(data.toJson());

class Bettacare {
  Bettacare({
    required this.id,
    required this.name,
    required this.nameeng,
    required this.description,
    required this.descriptioneng,
    required this.img1,
    required this.img2,
    required this.img3,
  });

  String id;
  String name;
  String nameeng;
  String description;
  String descriptioneng;
  String img1;
  String img2;
  String img3;

  factory Bettacare.fromJson(Map<String, dynamic> json) => Bettacare(
    id: json["id"],
    name: json["name"],
    nameeng: json["nameeng"],
    description: json["description"],
    descriptioneng: json["descriptioneng"],
    img1: json["img1"],
    img2: json["img2"],
    img3: json["img3"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nameeng": nameeng,
    "description": description,
    "descriptioneng": descriptioneng,
    "img1": img1,
    "img2": img2,
    "img3": img3,
  };
}
