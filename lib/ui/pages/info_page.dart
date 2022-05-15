import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9559FF).withOpacity(0.9),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Portable Quran App',
                style: txBold.copyWith(
                  color: whiteColor,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Version 1.0',
                style: txLight.copyWith(
                  color: Color(0xffDBDBDB),
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/logo_quran.png',
                // width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.contain,
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2,
                ),
                child: Text(
                  'UI App Design by : Tanvir Ahassan @tanvir_ux',
                  style: txLight.copyWith(
                    color: Color(0xffDBDBDB),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
