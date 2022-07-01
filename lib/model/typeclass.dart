import 'dart:convert';

Typebetta typebettaFromJson(String str) => Typebetta.fromJson(json.decode(str));

String typebettaToJson(Typebetta data) => json.encode(data.toJson());

class Typebetta {
  Typebetta({
    required this.id,
    required this.shortname,
    required this.name,
    required this.nameeng,
    required this.description,
    required this.descriptioneng,
    required this.shop,
    required this.shoplink,
    required this.img,
    required this.img1,
    required this.img2,
    required this.img3,
    required this.img4,
    required this.img5,
  });

  String id;
  String shortname;
  String name;
  String nameeng;
  String description;
  String descriptioneng;
  String shop;
  String shoplink;
  String img;
  String img1;
  String img2;
  String img3;
  String img4;
  String img5;

  factory Typebetta.fromJson(Map<String, dynamic> json) => Typebetta(
    id: json["id"],
    shortname: json["shortname"],
    name: json["name"],
    nameeng: json["nameeng"],
    description: json["description"],
    descriptioneng: json["descriptioneng"],
    shop: json["shop"],
    shoplink: json["shoplink"],
    img: json["img"],
    img1: json["img1"],
    img2: json["img2"],
    img3: json["img3"],
    img4: json["img4"],
    img5: json["img5"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shortname": shortname,
    "name": name,
    "nameeng": nameeng,
    "description": description,
    "descriptioneng": descriptioneng,
    "shop": shop,
    "shoplink": shoplink,
    "img": img,
    "img1": img1,
    "img2": img2,
    "img3": img3,
    "img4": img4,
    "img5": img5,
  };
}
