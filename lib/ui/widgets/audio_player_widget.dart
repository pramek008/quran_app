import 'package:flutter/material.dart';
import 'package:quran_app/theme.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final bool isPlaying;
  final String url;

  AudioPlayerWidget(this.duration, this.position, this.isPlaying, this.url,
      {Key? key})
      : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
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
            "Mishari Rashid al-`Afasy",
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
                      max: widget.duration.inMilliseconds.toDouble(),
                      value: widget.position.inSeconds.toDouble(),
                      onChanged: (value) async {},
                      activeColor: Colors.white,
                      inactiveColor: Colors.white38,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          formatTime(widget.position),
                          style: txRegular.copyWith(color: whiteColor),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Text(
                          formatTime(widget.duration - widget.position),
                          style: txRegular.copyWith(color: whiteColor),
                        ),
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: whiteColor.withOpacity(0.9),
                  child: IconButton(
                    onPressed: () async {
                      if (widget.isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        await audioPlayer.setSourceUrl(widget.url);
                        await audioPlayer.resume();
                      }
                    },
                    icon: Icon(
                      widget.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: purpleColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
