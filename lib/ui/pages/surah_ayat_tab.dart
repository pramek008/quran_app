import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/widgets/ayat_tile_widget.dart';
import 'package:quran_app/ui/widgets/card_heading_surah.dart';

class SurahAyatTab extends StatelessWidget {
  const SurahAyatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headingCard() {
      return HeadingCardSurahWidget();
    }

    Widget ayatList() {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 35,
        ),
        child: Column(
          children: [
            AyatTileWidget(),
            AyatTileWidget(),
            AyatTileWidget(),
            AyatTileWidget(),
            AyatTileWidget(),
            AyatTileWidget(),
            AyatTileWidget(),
            AyatTileWidget(),
            AyatTileWidget(),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            headingCard(),
            const SizedBox(
              height: 40,
            ),
            ayatList(),
          ],
        ),
      ),
    );
  }
}
