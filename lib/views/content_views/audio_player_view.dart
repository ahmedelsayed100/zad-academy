import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:zad_academy/views/ads_views/ad_mob_view.dart';

import '../../hub/widgets/common_code.dart';

class AudioPlayerView extends StatefulWidget {
  static String id = "audio_player_view";
  final String audioUrl, lessonLabel;
  const AudioPlayerView(
      {Key? key, required this.audioUrl, required this.lessonLabel})
      : super(key: key);

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  final AudioPlayer advancedAudio = AudioPlayer();
  Duration _duration = const Duration();
  Duration _position = const Duration();

  bool isPlaying = false,
      isPaused = false,
      isLoop = false,
      isStop = false,
      isRepeat = false,
      isClicked = false;
  final List<IconData> _icons = const [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
    Icons.stop_circle,
    Icons.loop_rounded,
  ];
  double value = 0.0, completeValue = 0.0;
  var x = SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  @override
  void initState() {
    advancedAudio.setUrl(widget.audioUrl);
    super.initState();
    advancedAudio.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    advancedAudio.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    advancedAudio.onPlayerCompletion.listen((p) {
      setState(() {
        _position = const Duration(seconds: 0);
        isPlaying = false;
      });
    });
  }

  void changeToSeconds(seconds) {
    Duration newDuration = Duration(seconds: seconds);
    advancedAudio.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
      height: returnHeight(context) * 0.1,
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          btnLoop(),
          btnStart(),
          btnStop(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    advancedAudio.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lessonLabel,
        ),
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIconAvatar(context: context),
              SizedBox(
                height: returnHeight(context) * 0.17,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  // vertical: returnHeight(context) * 0.01,
                  horizontal: returnWidth(context) * 0.08,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _position.toString().split('.')[0],
                    ),
                    Text(
                      _duration.toString().split('.')[0],
                    ),
                  ],
                ),
              ),
              slider(),
              loadAsset(),
              const SizedBox(
                height: 20,
              ),
              const AdMobView(),
            ],
          ),
          isPlaying == true && value < 1 ? downloadBook() : const SizedBox(),
        ],
      ),
    );
  }

  Widget btnStart() {
    return IconButton(
        icon: !isPlaying
            ? Icon(
                _icons[0],
                size: returnHeight(context) * 0.07,
                color: Colors.grey,
              )
            : _duration.inSeconds > 10.0
                ? Icon(
                    _icons[1],
                    size: returnHeight(context) * 0.07,
                    color: Colors.orangeAccent,
                  )
                : Icon(
                    _icons[0],
                    size: returnHeight(context) * 0.07,
                    color: Colors.orangeAccent,
                  ),
        onPressed: () => playingAudio());
  }

  void playingAudio() async {
    {
      if (isPlaying == false) {
        downlaodProgress();

        await advancedAudio.play(
          widget.audioUrl.toString(),
          volume: 40,
          duckAudio: true,
          respectSilence: false,
          stayAwake: true,
        );
        setState(() {
          isPlaying = true;
        });
        // downlaodProgress();
        // downloadBook(context: context);

      } else if (isPlaying = true) {
        advancedAudio.pause();
        setState(() {
          isPlaying = false;
        });
      }
    }
  }

  Widget slider() {
    return SizedBox(
      width: returnWidth(context) * 0.95,
      child: Slider(
          activeColor: Colors.amber[700],
          inactiveColor: Colors.grey,
          value: _position.inSeconds.toDouble(),
          min: 0.0,
          max: _duration.inSeconds.toDouble(),
          onChanged: (double value) {
            setState(() {
              changeToSeconds(value.toInt());
              value = value;
            });
          }),
    );
  }

  Widget btnStop() {
    return IconButton(
      icon: Icon(
        _icons[2],
        size: returnHeight(context) * 0.07,
        color: !isClicked == false ? Colors.grey : Colors.amber,
      ),
      onPressed: () {
        advancedAudio.stop();
        advancedAudio.dispose();
        setState(() {
          isClicked = !isClicked;
        });
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
      color: !isRepeat ? Colors.grey : Colors.orangeAccent,
      icon: Icon(
        _icons[3],
        size: returnHeight(context) * 0.07,
      ),
      onPressed: () {
        advancedAudio.setReleaseMode(ReleaseMode.LOOP);
        setState(() {
          isRepeat = !isRepeat;
        });
      },
    );
  }

  void downlaodProgress() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        if (value == 1) {
        } else {
          value = value + 0.4;
        }
      });
    });
  }

  Widget downloadBook() {
    return Positioned(
      top: returnHeight(context) * 0.15,
      left: returnWidth(context) * .02,
      right: returnWidth(context) * .02,
      child: buildAlertDialogForProgress(
        context: context,
        progressvValue: value,
      ),
    );
  }
}
