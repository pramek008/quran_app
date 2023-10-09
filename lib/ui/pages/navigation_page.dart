// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/page_cubit.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/pages/bookmark_page.dart';
import 'package:quran_app/ui/pages/home_page.dart';
import 'package:quran_app/ui/pages/info_page.dart';
// import 'package:quran_app/ui/pages/nointernet_page.dart';
import 'package:quran_app/ui/pages/pray_page.dart';
import 'package:quran_app/ui/pages/salat_page.dart';
import 'package:quran_app/ui/widgets/navbar_item_widget.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return SalatPage();
        case 2:
          return PrayPage();
        case 3:
          return BookmarkPage();
        case 4:
          return InfoPage();
        default:
          return HomePage();
      }
    }

    Widget buildBottomNavBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavbarItemWidget(
                imgUrl: 'assets/icon_quran.png',
                index: 0,
              ),
              NavbarItemWidget(
                imgUrl: 'assets/icon_salat.png',
                index: 1,
              ),
              NavbarItemWidget(
                imgUrl: 'assets/icon_pray.png',
                index: 2,
              ),
              NavbarItemWidget(
                imgUrl: 'assets/icon_bookmark.png',
                index: 3,
              ),
              NavbarItemWidget(
                imgUrl: 'assets/icon_info.png',
                index: 4,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgrounColor,
          body: SafeArea(
            child: Stack(
              children: [
                buildContent(currentIndex),
                buildBottomNavBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}
