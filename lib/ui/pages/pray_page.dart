import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class PrayPage extends StatelessWidget {
  const PrayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Pray Page',
              style: txBold.copyWith(
                color: primaryColor,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Image.asset(
              'assets/icon_noPackage.png',
              // width: MediaQuery.of(context).size.width * 0.4,
              // height: MediaQuery.of(context).size.height * 0.4,
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Maaf, konten masih dalam pengembangan',
              style: txBold.copyWith(
                color: purpleColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
