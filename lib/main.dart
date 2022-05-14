import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/bloc/all_surah_bloc.dart';
import 'package:quran_app/bloc/page_cubit.dart';
import 'package:quran_app/bloc/surah_detail_bloc.dart';
import 'package:quran_app/ui/pages/home_page.dart';
import 'package:quran_app/ui/pages/navigation_page.dart';
import 'package:quran_app/ui/pages/on_board_page.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AllSurahBloc(),
        ),
        BlocProvider(
          create: (context) => SurahDetailBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Quran App',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routes: {
          '/': (context) => OnBoardPage(),
          '/navigation': (context) => NavigationPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
