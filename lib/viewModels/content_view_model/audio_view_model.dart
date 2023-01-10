import 'package:flutter/material.dart';

class AudioViewModel {
  final textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 21,
    fontWeight: FontWeight.w500,
  );

  List buttonsLabels = ["", "", ""];
  List allLevelsAudiosUrl = [
    //sem 1
    [
      //1-24
      "https://archive.org/download/zad-acdmy-L1/tfsr-l1-mohd-mnjd-",
      //1-22
      "https://archive.org/download/zad-acdmy-L1/aqeda-l1-abo-zyd-qbi-",
      //0-36
      "https://archive.org/download/zad-acdmy-L1/fiqh-l1-mnsor-ghamdi-",
      //1-24
      "https://archive.org/download/zad-acdmy-L1/arbc-l1-nasr-jhni-",
      //0-24
      "https://archive.org/download/zad-acdmy-L1/trbia-l1-3bdel-3ziz-jhni-",
      //0-24
      "https://archive.org/download/zad-acdmy-L1/sera-l1-m3asm-7kim-",
      //0-24
      "https://archive.org/download/zad-acdmy-L1/hadeth-l1-mwfq-ghmdi-",
    ],
    //sem 2
    [
      // 1-24 except tafseer 1-36
      "https://archive.org/download/zad-acdmy-L2/Tafsir-S2-",
      "https://archive.org/download/zad-acdmy-L2/Aqeda-S2-",
      "https://archive.org/download/zad-acdmy-L2/Fiqh-S2-",
      "https://archive.org/download/zad-acdmy-L2/Arbc-S2-",
      "https://archive.org/download/zad-acdmy-L2/Trbyh-S2-",
      "https://archive.org/download/zad-acdmy-L2/Serah-S2-",
      "https://archive.org/download/zad-acdmy-L2/Hadith-S2-",
    ],
    //sem 3
    [
      "https://archive.org/download/tafsser-s-3-24/Tafsser-s3-",
      "https://archive.org/download/aqeedah-s-3-03/Aqeedah-S3-",
      "https://archive.org/download/fiqh-s3-10/fiqh-s3-",
      "https://archive.org/download/arabic-s-3-04/Arabic-S3-",
      "https://archive.org/download/tarbiah-s3-22/tarbiah-s3-",
      "https://archive.org/download/seerah-s-3-11/Seerah-S3-",
      "https://archive.org/download/hadith-s3-11/hadith-s3-",
    ],
    //sem 4
    [
      "https://archive.org/download/tafseer-s-4-17/Tafseer-S4-",
      "https://archive.org/download/aqeedah-s-4-18/Aqeedah-S4-",
      "https://archive.org/download/fiqh-s4-16/fiqh-s4-",
      "https://archive.org/download/arabic-s-4-08/Arabic-S4-",
      "https://archive.org/download/tarbiah-s4-24/tarbiah-s4-",
      "https://archive.org/download/seerah-s-4-23/Seerah-S4-",
      "https://archive.org/download/hadith-s-4-14/Hadith-S4-",
    ],
  ];
  // "https://archive.org/download/hadith-s-4-14/Hadith-S4-01.m4a",

  checkCategIndex(value) {
    switch (value) {
      case "التفسير":
        return 0;
      case "العقيدة":
        return 1;

      case "الفقه":
        return 2;

      case "اللغة العربية":
        return 3;

      case "التربية الإسلامية":
        return 4;

      case "السيرة النبوية":
        return 5;

      case "الحديث":
        return 6;
    }
  }

  checkLevelIndex(value) {
    switch (value) {
      case "المستوي الأول":
        return 0;

      case "المستوي الثاني":
        return 1;

      case "المستوي الثالث":
        return 2;

      case "المستوي الرابع":
        return 3;
    }
  }

  int getlengthOfSubjectList(value) {
    int x = 0, y = 24;
    switch (value) {
      case "التفسير":
        x = y;
        break;
      case "العقيدة":
        x = y;
        break;
      case "الفقه":
        x = 37;
        break;
      case "اللغة العربية":
        x = y;
        break;

      case "التربية الإسلامية":
        x = y;
        break;

      case "السيرة النبوية":
        x = y;
        break;

      case "الحديث":
        x = y;
        break;
    }
    return x;
  }
}

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class AudioFile extends StatefulWidget {
//   const AudioFile({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<AudioFile> createState() => _AudioFileState();
// }

// class _AudioFileState extends State<AudioFile> {
//   final AudioPlayer advancedAudio = AudioPlayer();
//   Duration _duration = const Duration();
//   Duration _position = const Duration();
//   String audioUrl =
//       "https://ia801709.us.archive.org/3/items/hassan_mohaed_saleh/018.mp3";
//   bool isPlaying = false, isPaused = false, isLoop = false, isStop = false;
//   final List<IconData> _icons = const [
//     Icons.play_circle_fill,
//     Icons.pause_circle_filled,
//     Icons.skip_next_rounded,
//     Icons.skip_previous,
//   ];

//   @override
//   void initState() {
//     super.initState();
//     advancedAudio.onDurationChanged.listen((d) {
//       setState(() {
//         _duration = d;
//       });
//     });
//     advancedAudio.onAudioPositionChanged.listen((p) {
//       setState(() {
//         _position = p;
//       });
//     });
//     advancedAudio.setUrl(audioUrl.toString());
//     advancedAudio.onPlayerCompletion.listen((p) {
//       setState(() {
//         _position = const Duration(seconds: 0);
//         isPlaying = false;
//       });
//     });
//   }

//   void changeToSeconds(seconds) {
//     Duration newDuration = Duration(seconds: seconds);
//     advancedAudio.seek(newDuration);
//   }

//   Widget loadAsset() {
//     return Container(
//       color: Colors.white,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           btnPervious(newAudioUrl: ""),
//           btnStart(),
//           btnNext(newAudioUrl: ""),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     advancedAudio.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("playing Audio"),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     _position.toString().split('.')[0],
//                   ),
//                   Text(
//                     _duration.toString().split('.')[0],
//                   ),
//                 ],
//               ),
//             ),
//             slider(),
//             loadAsset(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget btnStart() {
//     return IconButton(
//       icon: isPlaying == false
//           ? Icon(
//               _icons[0],
//               size: 40,
//               color: Colors.blue,
//             )
//           : Icon(
//               _icons[1],
//               size: 40,
//               color: Colors.blue,
//             ),
//       onPressed: () {
//         if (isPlaying == false) {
//           print("playing");
//           advancedAudio.play(
//             audioUrl,
//             volume: 40,
//             duckAudio: true,
//             respectSilence: false,
//             stayAwake: true,
//           );
//           setState(() {
//             isPlaying = true;
//           });
//         } else if (isPlaying = true) {
//           advancedAudio.pause();
//           setState(() {
//             isPlaying = false;
//           });
//         }
//       },
//     );
//   }

//   Widget slider() {
//     return Slider(
//         activeColor: Colors.red,
//         inactiveColor: Colors.grey,
//         value: _position.inSeconds.toDouble(),
//         min: 0.0,
//         max: _duration.inSeconds.toDouble(),
//         onChanged: (double value) {
//           setState(() {
//             changeToSeconds(value.toInt());
//             value = value;
//           });
//         });
//   }

//   Widget btnNext({newAudioUrl}) {
//     return IconButton(
//       icon: Icon(
//         _icons[2],
//         size: 40,
//         color: Colors.blue,
//       ),
//       onPressed: () {
//         int index = 0;
//         if (index < 23) {
//           setState(() {
//             audioUrl =
//                 "https://archive.org/download/zad-acdmy-L1/tfsr-l1-mohd-mnjd-01.mp3";
//           });
//         }
//       },
//     );
//   }

//   Widget btnPervious({newAudioUrl}) {
//     return IconButton(
//       icon: Icon(
//         _icons[3],
//         size: 40,
//         color: Colors.blue,
//       ),
//       onPressed: () {
//         int index = 0;
//         if (index < 0) {
//           setState(() {
//             audioUrl =
//                 "https://archive.org/download/zad-acdmy-L1/tfsr-l1-mohd-mnjd-01.mp3";
//           });
//         }
//       },
//     );
//   }
// }
