import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/surah_detail_bloc.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/widgets/tafsir_tile_widget.dart';
import 'dart:convert';

class SurahTafsirTab extends StatelessWidget {
  const SurahTafsirTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
        builder: (context, state) {
          if (state is SurahDetailSucces) {
            /*
            Method consume nya agak berbeda dari sebelumnya yang sekedar 
              menggunakan ".map" kemudian mereturn widget list (bisa dilihat di SurahAyatTab)
            Karena data tafsir dalam API menggunakan struktur format (string, string)
              dan itu tidak ada dalam Model Data
            Jadi terlebih dahulu kita harus mengubah nya (antara nomor ayat dan tafsirnya)
              oleh karena itu digunakan Map
            Setelah di Map maka antara nomor dan tafsir akan terpisah
            */

            Map data = state.surahDetail.tafsir.id.kemenag.text;

            // print(data);

            return SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  /*
                  Jika sudah terpisah tinggal mengirimkan data ke widget TafsirTileWidget
                  .entries() digunakan untuk mengambil data dari Map (dimana ada 2 data seperti penjelasan sebelumnya)
                  Kemudian tinggal memasukan data kedalam variabel (jangan lupa buat variabel untuk menirma datanya di TafsirTileWidget)                  
                  */
                  children: data.entries
                      .map((e) => TafsirTileWidget(e.key, e.value))
                      .toList(),
                ));
          }
          return Center(
            child: CircularProgressIndicator(
              color: purpleColor,
            ),
          );
        },
      ),
    );
  }
}
