
import 'dart:convert';

Disease diseaseFromJson(String str) => Disease.fromJson(json.decode(str));

String diseaseToJson(Disease data) => json.encode(data.toJson());

class Disease {
  Disease({
    required this.id,
    required this.name,
    required this.nameeng,
    required this.description,
    required this.descriptioneeng,
    required this.treatment,
    required this.treatmenteng,
    required this.img,
  });

  String id;
  String name;
  String nameeng;
  String description;
  String descriptioneeng;
  String treatment;
  String treatmenteng;
  String img;

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
    id: json["id"],
    name: json["name"],
    nameeng: json["nameeng"],
    description: json["description"],
    descriptioneeng: json["descriptioneeng"],
    treatment: json["treatment"],
    treatmenteng: json["treatmenteng"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nameeng": nameeng,
    "description": description,
    "descriptioneeng": descriptioneeng,
    "treatment": treatment,
    "treatmenteng": treatmenteng,
    "img": img,
  };
}
