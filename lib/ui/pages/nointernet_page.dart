import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              // Text(
              //   'Bookmark Page',
              //   style: txBold.copyWith(
              //     color: primaryColor,
              //     fontSize: 30,
              //   ),
              // ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(
                'assets/icon_noInternet.png',
                // width: MediaQuery.of(context).size.width * 0.4,
                // height: MediaQuery.of(context).size.height * 0.4,
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Oops!, Tidak ada koneksi internet',
                style: txBold.copyWith(
                  color: purpleColor,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Whoops, tidak ada koneksi Internet\nTolong cek kembali koneksi Anda.',
                style: txRegular.copyWith(
                  color: greyColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
