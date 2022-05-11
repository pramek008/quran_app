import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/model/getall_surah_model.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/pages/surah_main_page.dart';

class SurahTileWidget extends StatelessWidget {
  final AllSurahModel getAllSurah;

  const SurahTileWidget(this.getAllSurah, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SurahPage(getAllSurah.numberOfSurah),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/logo_number_frame.png',
                        width: 40,
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          getAllSurah.numberOfSurah.toString(),
                          style: txMedium.copyWith(
                            color: blackColor,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getAllSurah.name, style: txMedium),
                    Row(
                      children: [
                        Text(
                          getAllSurah.type,
                          style: txMedium.copyWith(
                            color: greyColor,
                            fontSize: 12,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.circle_sharp,
                            color: greyColor,
                            size: 7,
                          ),
                        ),
                        Text(
                          '${getAllSurah.numberOfAyah} Ayat',
                          style: txMedium.copyWith(
                            color: greyColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  getAllSurah.nameTranslations.ar,
                  style: GoogleFonts.amiri(
                    fontSize: 20,
                    color: primaryColor,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              color: greyColor.withOpacity(0.3),
              height: 2,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
