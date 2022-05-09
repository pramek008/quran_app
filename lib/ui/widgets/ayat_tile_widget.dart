import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/theme.dart';

class AyatTileWidget extends StatelessWidget {
  const AyatTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        '290',
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
                    'يَكَادُ ٱلْبَرْقُ يَخْطَفُ أَبْصَٰرَهُمْ كُلَّمَآ أَضَآءَ لَهُم مَّشَوْا۟ فِيهِ وَإِذَآ أَظْلَمَ عَلَيْهِمْ قَامُوا۟ وَلَوْ شَآءَ ٱللَّهُ لَذَهَبَ بِسَمْعِهِمْ وَأَبْصَٰرِهِمْ إِنَّ ٱللَّهَ عَلَىٰ كُلِّ شَىْءٍ قَدِيرٌ',
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
                  'Segala puji bagi Allah, Tuhan semesta alam.',
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
