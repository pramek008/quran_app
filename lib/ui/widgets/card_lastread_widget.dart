import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class CardLastReadWidget extends StatelessWidget {
  const CardLastReadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffDF98FA),
            Color(0xff9055FF),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.height * -0.1,
            left: MediaQuery.of(context).size.width * 0.35,
            child: Image.asset(
              'assets/logo_quran.png',
              width: 250,
              height: 250,
              color: Colors.white.withOpacity(0.7),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 19,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logo_book.png',
                      width: 25,
                      height: 25,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Last Read',
                      style: txMedium.copyWith(
                        color: whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Al-Fatiha',
                      style: txSemiBold.copyWith(
                        color: whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Ayat No. 1',
                      style: txRegular.copyWith(
                        color: whiteColor,
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
