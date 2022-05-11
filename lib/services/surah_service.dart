import 'dart:convert';

import 'package:quran_app/model/getall_surah_model.dart';
import 'package:http/http.dart' as http;
import 'package:quran_app/model/surah_model.dart';
import 'package:dio/dio.dart';

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

      print('---------parsed Json----------');
      print(parseJson);
      return allsurah;
    } else {
      throw Exception('Failed to load surah');
    }
  }

  Future<SurahModel> getSurahDetail(int id) async {
    // Future<List<SurahModel>> getSurahDetail(int id) async {
    String url =
        'https://raw.githubusercontent.com/penggguna/QuranJSON/master/surah/$id.json';

    final response = await http.get(Uri.parse(url));

    // var dio = Dio();
    // final response = await dio.get(url);

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      SurahModel surahData = SurahModel.fromJson(json);
      // List parseJson = jsonDecode(response.data);

      // final parseJson = jsonDecode(response.body);

      // List listParseJson = parseJson.toList();

      // print('---------List Parse json----------');
      // print(parseJson);

      // for (var element in parseJson) {
      //   surahData.add(SurahModel.fromJson(element));
      // }

      // parseJson.forEach((element) {
      //   surahData.
      // });

      print('-------------------');
      print(surahData);

      // return SurahModel.fromJson(surahData as Map<String, dynamic>);
      return surahData;
    } else {
      throw Exception('Failed to load surah');
    }
  }
}
