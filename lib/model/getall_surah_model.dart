// To parse this JSON data, do
//
//     final surahModel = surahModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AllSurahModel {
  AllSurahModel({
    required this.name,
    required this.nameTranslations,
    required this.numberOfAyah,
    required this.numberOfSurah,
    required this.place,
    required this.recitation,
    required this.type,
  });

  final String name;
  final NameTranslations nameTranslations;
  final int numberOfAyah;
  final int numberOfSurah;
  final String place;
  final String recitation;
  final String type;

  factory AllSurahModel.fromRawJson(String str) =>
      AllSurahModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllSurahModel.fromJson(Map<String, dynamic> json) => AllSurahModel(
        name: json["name"],
        nameTranslations: NameTranslations.fromJson(json["name_translations"]),
        numberOfAyah: json["number_of_ayah"],
        numberOfSurah: json["number_of_surah"],
        place: json["place"],
        recitation: json["recitation"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_translations": nameTranslations.toJson(),
        "number_of_ayah": numberOfAyah,
        "number_of_surah": numberOfSurah,
        "place": place,
        "recitation": recitation,
        "type": type,
      };
}

class NameTranslations {
  NameTranslations({
    required this.ar,
    required this.en,
    required this.id,
  });

  final String ar;
  final String en;
  final String id;

  factory NameTranslations.fromRawJson(String str) =>
      NameTranslations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NameTranslations.fromJson(Map<String, dynamic> json) =>
      NameTranslations(
        ar: json["ar"],
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
        "id": id,
      };
}
