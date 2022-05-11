import 'dart:convert';

import 'package:quran_app/model/getall_surah_model.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/model/surah_model.dart';
// import 'package:dio/dio.dart';

class SurahService {
  Future<List<AllSurahModel>> getAllSurah() async {
    String url =
        'https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json';

    final response = await http.get(Uri.parse(url));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List<AllSurahModel> allsurah = [];
      List parseJson = jsonDecode(response.body);

      parseJson.forEach((element) {
        allsurah.add(AllSurahModel.fromJson(element));
      });
      return allsurah;
    } else {
      throw Exception('Failed to load surah');
    }
  }

  Future<List<SurahModel>> getSurahDetail(int id) async {
    String url =
        'https://raw.githubusercontent.com/penggguna/QuranJSON/master/surah/$id.json';

    final response = await http.get(Uri.parse(url));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      List<SurahModel> surah = [];
      List parseJson = jsonDecode(response.body);

      parseJson.forEach((element) {
        surah.add(SurahModel.fromJson(element));
      });
      return surah;
    } else {
      throw Exception('Failed to load surah');
    }
  }
}
