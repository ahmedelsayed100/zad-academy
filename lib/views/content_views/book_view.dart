import 'dart:io';
import 'dart:async';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../services/connectivity_provider.dart';
import '../../viewModels/content_view_model/book_view_model.dart';
import '../ads_views/ad_mob_view.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart' as path_prov;
import 'package:zad_academy/hub/widgets/common_code.dart';

class BookView extends StatefulWidget {
  static String id = "book_view";
  const BookView({Key? key}) : super(key: key);

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  var view = false, isClicked = false, offline = false, isLoading = false;
  final bookData = BookViewModel();
  double value = 0.0;
  String result = '';

  late Dio dio;
  int progress = 0;

  Future _getExternalDirectoryPath() {
    return path_prov.getExternalStorageDirectories(
      type: path_prov.StorageDirectory.documents,
    );
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
        valueFontSize: 18,
      );
      final dirList = await _getExternalDirectoryPath();
      final path = dirList[0].path;
      final file = File('$path/$fileName');

      // final file = File('/files/Documents/');
      await dio.download(urlPath, file.path, onReceiveProgress: (count, total) {
        setState(() {
          isLoading = true;
          progress = ((count / total) * 100).toInt();
          pr.update(value: progress == 0 ? 0 : progress);
        });
      });
      // print(file.path);
      pr.close();
    } catch (e) {
      // print(e);

    }
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    dio = Dio();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
    super.initState();
  }

  @override
  void dispose() {
    Dio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var checkOnline = Provider.of<ConnectivityProvider>(context, listen: false);

    var dataFromCourseResource =
        ModalRoute.of(context)?.settings.arguments as List;
    int categIndex = bookData.checkCategIndex(
      dataFromCourseResource[1].toString(),
    );

    int levelIndex = bookData.checkLevelIndex(dataFromCourseResource[2]);
    return Scaffold(
      appBar: popularAppBar(
        title: dataFromCourseResource[0].toString(),
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(returnWidth(context) * 0.02),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // ====== no internet warning message=============
                  offline == true
                      ? buildNoInternetWarning(context: context)
                      : const SizedBox(height: 1),
                  Stack(
                    children: [
                      Card(
                        elevation: 8,
                        child: Image.asset(
                          bookData.categoryImage[categIndex].toString(),
                          height: orientation == Orientation.landscape
                              ? returnHeight(context) * 0.5
                              : returnHeight(context) * 0.55,
                        ),
                      ),
                      isClicked == true && value < 1
                          ? downloadBook()
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: returnHeight(context) * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildCustomElevatedButton(
                          label: "عرض",
                          context: context,
                          fun: () {
                            // ignore: unnecessary_null_comparison
                            if (checkOnline.isOnline != null) {
                              if (checkOnline.isOnline == true) {
                                setState(() {
                                  isClicked = true;
                                });
                                downlaodProgress();
                                openFile(
                                  url: bookData.allLevelsBooksUrl[levelIndex]
                                          [categIndex]
                                      .toString(),
                                  fileName: "${dataFromCourseResource[1]}.pdf",
                                );
                              } else {
                                setState(() {
                                  offline = true;
                                });
                              }
                            }
                          }),
                      buildCustomElevatedButton(
                          label: "تحميل",
                          color: Colors.orange,
                          context: context,
                          fun: () {
                            // ignore: unnecessary_null_comparison
                            if (checkOnline.isOnline != null) {
                              if (checkOnline.isOnline == true) {
                                _dowloadAndSaveFile(
                                  context: context,
                                  fileName: "${dataFromCourseResource[1]}.pdf",
                                  urlPath: bookData
                                      .allLevelsBooksUrl[levelIndex][categIndex]
                                      .toString(),
                                );
                              }
                            } else {
                              setState(() {
                                offline = true;
                              });
                            }
                          }),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;
    // print('Path : ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await path_prov.getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }

  Widget showBook({categIndex, levelIndex}) {
    return Stack(
      children: [
        SizedBox(
          width: returnWidth(context),
          child: SfPdfViewer.network(
            bookData.allLevelsBooksUrl[levelIndex][categIndex],
            canShowPasswordDialog: true,
            pageSpacing: 1,
            canShowPaginationDialog: true,
            enableDoubleTapZooming: true,
          ),
        ),
        const AdMobView(),
      ],
    );
  }

  void downlaodProgress() {
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        if (value == 1) {
        } else {
          value = value + 0.5;
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
