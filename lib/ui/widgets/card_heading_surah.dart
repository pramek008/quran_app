import 'package:flutter/material.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/theme.dart';

class HeadingCardSurahWidget extends StatelessWidget {
  final SurahModel surah;

  const HeadingCardSurahWidget(this.surah, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.36,
      padding: const EdgeInsets.symmetric(
        vertical: 28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffDF98FA),
            Color(0xff9055FF),
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  surah.name,
                  style: txMedium.copyWith(
                    color: whiteColor,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  surah.nameTranslations.id,
                  style: txMedium.copyWith(
                    color: whiteColor,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: MediaQuery.of(context).size.width * 0.2,
                  ),
                  child: Divider(
                    thickness: 2,
                    color: whiteColor.withOpacity(0.35),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      surah.type,
                      style: txMedium.copyWith(
                        color: whiteColor.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: Icon(
                        Icons.circle,
                        color: whiteColor.withOpacity(0.9),
                        size: 10,
                      ),
                    ),
                    Text(
                      '${surah.numberOfAyah} Ayat',
                      style: txMedium.copyWith(
                        color: whiteColor.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Image.asset(
                  'assets/logo_bismilah.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
