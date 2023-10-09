// To parse this JSON data, do
//
//     final surahModel = surahModelFromJson(jsonString);

import 'dart:convert';

class SurahModel {
  SurahModel({
    required this.name,
    required this.nameTranslations,
    required this.numberOfAyah,
    required this.numberOfSurah,
    required this.place,
    required this.recitations,
    required this.type,
    required this.verses,
    required this.tafsir,
  });

  final String name;
  final NameTranslations nameTranslations;
  final int numberOfAyah;
  final int numberOfSurah;
  final String place;
  final List<Recitation> recitations;
  final String type;
  final List<Verse> verses;
  final Tafsir tafsir;

  factory SurahModel.fromRawJson(String str) =>
      SurahModel.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        name: json["name"],
        nameTranslations: NameTranslations.fromJson(
            json["name_translations"] as Map<String, dynamic>),
        numberOfAyah: json["number_of_ayah"],
        numberOfSurah: json["number_of_surah"],
        place: json["place"],
        recitations: List<Recitation>.from(
            json["recitations"].map((x) => Recitation.fromJson(x))),
        type: json["type"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
        tafsir: Tafsir.fromJson(json["tafsir"]),
      );

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "name_translations": nameTranslations.toJson(),
  //       "number_of_ayah": numberOfAyah,
  //       "number_of_surah": numberOfSurah,
  //       "place": place,
  //       "recitations": List<dynamic>.from(recitations.map((x) => x.toJson())),
  //       "type": type,
  //       "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
  //       "tafsir": tafsir.toJson(),
  //     };

  List<Object?> get props => [
        name,
        nameTranslations,
        numberOfAyah,
        numberOfSurah,
        place,
        recitations,
        type,
        verses,
        tafsir,
      ];
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

class Recitation {
  Recitation({
    required this.name,
    required this.audioUrl,
  });

  final String name;
  final String audioUrl;

  factory Recitation.fromRawJson(String str) =>
      Recitation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recitation.fromJson(Map<String, dynamic> json) => Recitation(
        name: json["name"],
        audioUrl: json["audio_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "audio_url": audioUrl,
      };
}

class Tafsir {
  Tafsir({
    required this.id,
  });

  final Id id;

  factory Tafsir.fromRawJson(String str) => Tafsir.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: Id.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id.toJson(),
      };
}

class Id {
  Id({
    required this.kemenag,
  });

  final Kemenag kemenag;

  factory Id.fromRawJson(String str) => Id.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kemenag: Kemenag.fromJson(json["kemenag"]),
      );

  Map<String, dynamic> toJson() => {
        "kemenag": kemenag.toJson(),
      };
}

class Kemenag {
  Kemenag({
    required this.name,
    required this.source,
    required this.text,
  });

  final String name;
  final String source;
  final Map<String, String> text;

  factory Kemenag.fromRawJson(String str) => Kemenag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Kemenag.fromJson(Map<String, dynamic> json) => Kemenag(
        name: json["name"],
        source: json["source"],
        text: Map.from(json["text"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "source": source,
        "text": Map.from(text).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Verse {
  Verse({
    required this.number,
    required this.text,
    required this.translationEn,
    required this.translationId,
  });

  final int number;
  final String text;
  final String translationEn;
  final String translationId;

  factory Verse.fromRawJson(String str) => Verse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        number: json["number"],
        text: json["text"],
        translationEn: json["translation_en"],
        translationId: json["translation_id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "text": text,
        "translation_en": translationEn,
        "translation_id": translationId,
      };
}
