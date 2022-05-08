import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/widgets/card_lastread_widget.dart';
import 'package:quran_app/ui/widgets/surah_tile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Padding(
        padding: EdgeInsets.only(
          top: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            Icon(
              Icons.menu_rounded,
              color: greyColor,
              size: 30,
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              'Quran App',
              style: txBold.copyWith(
                color: scdPurpleColor,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.search_outlined,
              color: greyColor,
              size: 30,
            ),
          ],
        ),
      );
    }

    Widget cardLastRead() {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 24,
        ),
        child: CardLastReadWidget(),
      );
    }

    Widget surahList() {
      return Column(
        children: [
          SurahTileWidget(),
          SurahTileWidget(),
          SurahTileWidget(),
          SurahTileWidget(),
          SurahTileWidget(),
          SurahTileWidget(),
          SurahTileWidget(),
          SurahTileWidget(),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar(),
                cardLastRead(),
                surahList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
