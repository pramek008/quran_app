import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 90,
        ),
        child: Column(
          children: [
            Text(
              'Quran App',
              style: txBold.copyWith(color: scdPurpleColor, fontSize: 28),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Learn Quran and Recite once everyday',
              style: txRegular.copyWith(
                color: greyColor,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            // Stack(
            //   children: [],
            // )
          ],
        ),
      );
    }

    Widget illustration() => Padding(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            top: 40,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/backgroud.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: Image.asset(
                    'assets/logo_quran.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.58),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/navigation', (route) => false);
                    },
                    child: Text(
                      'Get Started',
                      style: txSemiBold.copyWith(
                        color: whiteColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title(),
            illustration(),
          ],
        ),
      ),
    );
  }
}
