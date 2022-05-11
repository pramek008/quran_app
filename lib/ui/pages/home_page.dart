import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/all_surah_bloc.dart';
import 'package:quran_app/model/getall_surah_model.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/theme.dart';
import 'package:quran_app/ui/widgets/card_lastread_widget.dart';
import 'package:quran_app/ui/widgets/surah_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<AllSurahBloc>().add(LoadApiEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Padding(
        padding: EdgeInsets.only(
          top: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            Icon(
              Icons.menu_rounded,
              color: greyColor,
              size: 30,
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              'Quran App',
              style: txBold.copyWith(
                color: scdPurpleColor,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.search_outlined,
              color: greyColor,
              size: 30,
            ),
          ],
        ),
      );
    }

    Widget cardLastRead() {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 24,
        ),
        child: CardLastReadWidget(),
      );
    }

    Widget surahList(List<AllSurahModel> allSurah) {
      return Column(
          children: allSurah.map((surah) {
        return SurahTileWidget(surah);
      }).toList());
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<AllSurahBloc, AllSurahState>(
              builder: (context, state) {
                if (state is AllSurahSucces) {
                  return Column(
                    children: [
                      appBar(),
                      cardLastRead(),
                      surahList(state.surahList),
                    ],
                  );
                } else if (state is AllSurahFailed) {
                  return const Center(
                    child: Text('Error'),
                  );
                }
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                );
                // return Column(
                //   children: [
                //     appBar(),
                //     cardLastRead(),
                //     surahList([]),
                //   ],
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
