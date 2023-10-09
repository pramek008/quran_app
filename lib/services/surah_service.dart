import 'dart:convert';

import 'package:quran_app/model/getall_surah_model.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/model/surah_model.dart';

class SurahService {
  Future<List<AllSurahModel>> getAllSurah() async {
    String url =
        'https://raw.githubusercontent.com/penggguna/QuranJSON/master/quran.json';

    final response = await http.get(Uri.parse(url));

    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      List<AllSurahModel> allsurah = [];
      List parseJson = jsonDecode(response.body);

      for (var element in parseJson) {
        allsurah.add(AllSurahModel.fromJson(element));
      }

      // print('---------parsed Json----------');
      // print(parseJson);

      return allsurah;
    } else {
      throw Exception('Failed to load surah');
    }
  }

  Future<SurahModel> getSurahDetail(int id) async {
    String url =
        'https://raw.githubusercontent.com/penggguna/QuranJSON/master/surah/$id.json';

    final response = await http.get(Uri.parse(url));

    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      SurahModel surahData = SurahModel.fromJson(json);

      // print(surahData);

      return surahData;
    } else {
      throw Exception('Failed to load surah');
    }
  }
}
