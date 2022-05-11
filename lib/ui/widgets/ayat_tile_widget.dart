import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/theme.dart';

class AyatTileWidget extends StatelessWidget {
  final Verse surah;
  const AyatTileWidget(this.surah, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String bismilah = 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ';

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/logo_number_frame.png',
                    ),
                    Center(
                      child: Text(
                        surah.number.toString(),
                        style: txMedium.copyWith(
                          color: blackColor,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    surah.text == bismilah
                        ? surah.text
                        : surah.text.replaceAll(
                            RegExp(r'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ'),
                            ' '),
                    style: GoogleFonts.amiri(
                      fontSize: 30,
                      color: blackColor,
                      height: 2.5,
                      // letterSpacing: 1,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  surah.translationId,
                  style: txRegular.copyWith(
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
            ),
            child: Divider(
              color: greyColor.withOpacity(0.3),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
