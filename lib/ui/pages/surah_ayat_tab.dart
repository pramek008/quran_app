import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/surah_detail_bloc.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/widgets/ayat_tile_widget.dart';
import 'package:quran_app/ui/widgets/card_heading_surah.dart';

class SurahAyatTab extends StatelessWidget {
  const SurahAyatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headingCard(SurahModel surah) {
      return HeadingCardSurahWidget(surah);
    }

    Widget ayatList(SurahModel surah) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 35,
        ),
        child: Column(
          children: surah.verses.map((e) => AyatTileWidget(e)).toList(),
        ),
      );
    }

    return Scaffold(
      body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
        builder: (context, state) {
          if (state is SurahDetailSucces) {
            return SafeArea(
              child: ListView(
                children: [
                  headingCard(state.surahDetail),
                  const SizedBox(
                    height: 40,
                  ),
                  ayatList(state.surahDetail),
                ],
              ),
            );
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
