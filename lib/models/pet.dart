import 'dart:convert';

List<Pet> petFromJson(String str) =>
    List<Pet>.from(json.decode(str).map((x) => Pet.fromJson(x)));

String petToJson(List<Pet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pet {
  Pet({
    required this.about,
    required this.age,
    required this.breed,
    required this.gender,
    required this.healthInfo,
    required this.id,
    required this.location,
    required this.name,
    required this.phone,
    required this.picture,
    required this.type,
  });

  final String about;
  final int age;
  final String breed;
  final bool gender;
  final String healthInfo;
  final int id;
  final String location;
  final String name;
  final int phone;
  final String picture;
  final String type;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        about: json["about"],
        age: json["age"],
        breed: json["breed"],
        gender: json["gender"],
        healthInfo: json["healthInfo"],
        id: json["id"],
        location: json["location"],
        name: json["name"],
        phone: json["phone"],
        picture: json["picture"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "age": age,
        "breed": breed,
        "gender": gender,
        "healthInfo": healthInfo,
        "id": id,
        "location": location,
        "name": name,
        "phone": phone,
        "picture": picture,
        "type": type,
      };
}
