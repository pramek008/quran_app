import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/ui/pages/home_page.dart';
import 'package:quran_app/ui/pages/on_board_page.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Quran App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routes: {
        '/': (context) => OnBoardPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
