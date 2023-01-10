import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_prov;
import 'package:zad_academy/hub/widgets/common_code.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import '../../viewModels/content_view_model/audio_view_model.dart';
import 'audio_player_view.dart';

class AudioView extends StatefulWidget {
  static String id = "audio_view";
  const AudioView({Key? key}) : super(key: key);

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  final audioData = AudioViewModel();
  bool isClicked = false, offline = false, isLoading = false;

  late Dio dio;
  int progress = 0;

  Future _getExternalDirectoryPath() {
    return path_prov.getExternalStorageDirectories(
        type: path_prov.StorageDirectory.documents);
  }

  _dowloadAndSaveFile({fileName, urlPath, context}) async {
    ProgressDialog pr;
    pr = ProgressDialog(context: context);

    try {
      pr.show(
        max: 100,
        msg: "...جاري تحميل الملف",
        elevation: 5,
        completed: Completed(),
        progressType: ProgressType.valuable,
        valueColor: Colors.deepOrange,
        progressValueColor: Colors.amberAccent,
        valuePosition: ValuePosition.center,
        barrierDismissible: true,
      );
      final dirList = await _getExternalDirectoryPath();
      final path = dirList[0].path;
      final file = File('$path/$fileName');
      await dio.download(urlPath, file.path, onReceiveProgress: (count, total) {
        setState(() {
          isLoading = true;
          progress = ((count / total) * 100).toInt();
          pr.update(value: progress);
        });
      });
      pr.close();
    } catch (e) {
      //
    }
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    dio = Dio();

    super.initState();
  }

  @override
  void dispose() {
    Dio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var dataFromCourseResource =
        ModalRoute.of(context)?.settings.arguments as List;
    int categIndex = audioData.checkCategIndex(
      dataFromCourseResource[1].toString(),
    );
    int levelIndex = audioData.checkLevelIndex(dataFromCourseResource[2]);
    return Scaffold(
      appBar: popularAppBar(title: dataFromCourseResource[0].toString()),
      body: ListView.builder(
        itemCount: audioData.getlengthOfSubjectList(
          dataFromCourseResource[1].toString(),
        ),
        itemBuilder: (_, index) {
          return Card(
            margin: EdgeInsets.all(returnWidth(context) * 0.02),
            color: Colors.orange,
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(returnWidth(context) * 0.026),
              child: Column(
                children: [
                  Text(
                    "الدرس ${index + 1} :  ${dataFromCourseResource[1].toString()}",
                    style: audioData.textStyle,
                  ),
                  SizedBox(height: returnHeight(context) * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildAudioActionsButton(
                        context: context,
                        dataFromCourseResource: dataFromCourseResource,
                        index: index,
                        levelIndex: levelIndex,
                        categIndex: categIndex,
                        icon: Icons.download_for_offline_outlined,
                        label: "تحميل",
                        funct: () {
                          final level = dataFromCourseResource[2].toString();
                          if (level == "المستوي الرابع" ||
                              level == "المستوي الثالث") {
                            _dowloadAndSaveFile(
                              context: context,
                              fileName: dataFromCourseResource[0].toString(),
                              urlPath:
                                  "${audioData.allLevelsAudiosUrl[levelIndex][categIndex]}0${index + 1}.m4a",
                            );
                          } else {
                            _dowloadAndSaveFile(
                              context: context,
                              fileName: dataFromCourseResource[0].toString(),
                              urlPath:
                                  "${audioData.allLevelsAudiosUrl[levelIndex][categIndex]}0$index.mp3",
                            );
                          }
                        },
                      ),
                      //=================================

                      buildAudioActionsButton(
                          context: context,
                          dataFromCourseResource: dataFromCourseResource,
                          index: index,
                          levelIndex: levelIndex,
                          categIndex: categIndex,
                          icon: Icons.arrow_forward_rounded,
                          label: "إنتقل للتشغيل",
                          funct: () {
                            final level = dataFromCourseResource[2].toString();
                            if (level == "المستوي الرابع" ||
                                level == "المستوي الثالث") {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return AudioPlayerView(
                                  audioUrl:
                                      "${audioData.allLevelsAudiosUrl[levelIndex][categIndex]}0${index + 1}.m4a",
                                  lessonLabel:
                                      "الدرس ${index + 1} :  ${dataFromCourseResource[1].toString()}",
                                );
                              }));
                            } else {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return AudioPlayerView(
                                  audioUrl:
                                      "${audioData.allLevelsAudiosUrl[levelIndex][categIndex]}0$index.mp3",
                                  lessonLabel:
                                      "الدرس ${index + 1} :  ${dataFromCourseResource[1].toString()}",
                                );
                              }));
                            }
                          }),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ElevatedButton buildAudioActionsButton(
      {context,
      dataFromCourseResource,
      index,
      levelIndex,
      categIndex,
      icon,
      label,
      funct}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orangeAccent,
        elevation: 5,
        fixedSize:
            Size(returnWidth(context) * 0.43, returnHeight(context) * 0.06),
      ),
      onPressed: funct,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: audioData.textStyle,
      ),
    );
  }

  //=========================new code for downloading ==================

}
