import 'package:flutter/material.dart';
import 'package:quran_app/ui/widgets/tafsir_tile_widget.dart';

class SurahTafsirTab extends StatelessWidget {
  const SurahTafsirTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(bottom: 30),
        children: [
          TafsirTileWidget(),
          TafsirTileWidget(),
        ],
      ),
    );
  }
}
