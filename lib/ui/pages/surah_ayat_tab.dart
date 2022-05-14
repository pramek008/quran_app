import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/bloc/surah_detail_bloc.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:quran_app/theme.dart';
// import 'package:quran_app/ui/widgets/audio_player_widget.dart';
import 'package:quran_app/ui/widgets/ayat_tile_widget.dart';
import 'package:quran_app/ui/widgets/card_heading_surah.dart';

class SurahAyatTab extends StatefulWidget {
  const SurahAyatTab({Key? key}) : super(key: key);

  @override
  State<SurahAyatTab> createState() => _SurahAyatTabState();
}

class _SurahAyatTabState extends State<SurahAyatTab> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget headingCard(SurahModel surah) {
      return HeadingCardSurahWidget(surah);
    }

    Widget surahAudio(SurahModel surah) {
      String formatTime(Duration duration) {
        String twoDigits(int n) => n.toString().padLeft(2, '0');

        final hours = twoDigits(duration.inHours);
        final minutes = twoDigits(duration.inMinutes.remainder(60));
        final seconds = twoDigits(duration.inSeconds.remainder(60));

        return [
          if (duration.inHours > 0) hours,
          minutes,
          seconds,
        ].join(':');
      }

      return Container(
        padding: const EdgeInsets.symmetric(
          // horizontal: 10,
          vertical: 20,
        ),
        width: double.infinity,
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
        child: Column(
          children: [
            Text(
              surah.recitations.first.name,
              style: txRegular.copyWith(
                color: whiteColor,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Slider(
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) async {
                          final position = Duration(seconds: value.toInt());
                          await audioPlayer.seek(position);

                          await audioPlayer.resume();
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.white38,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            formatTime(position),
                            style: txRegular.copyWith(color: whiteColor),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Text(
                            formatTime(duration - position),
                            style: txRegular.copyWith(color: whiteColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          String url = surah.recitations.first.audioUrl;

                          await audioPlayer.play(url);
                        }
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: purpleColor,
                      ),
                    ),
                    backgroundColor: whiteColor.withOpacity(0.9),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget ayatList(SurahModel surah) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 35,
        ),
        child: Column(
          children: surah.verses.map((e) => AyatTileWidget(e)).toList(),
        ),
      );
    }

    return Scaffold(
      body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
        builder: (context, state) {
          if (state is SurahDetailSucces) {
            return SafeArea(
              child: ListView(
                children: [
                  headingCard(state.surahDetail),
                  const SizedBox(
                    height: 30,
                  ),
                  surahAudio(state.surahDetail),
                  const SizedBox(
                    height: 40,
                  ),
                  ayatList(state.surahDetail),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: purpleColor,
            ),
          );
        },
      ),
    );
  }
}
