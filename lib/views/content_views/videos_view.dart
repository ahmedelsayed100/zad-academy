import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../hub/widgets/common_code.dart';
import '../../viewModels/content_view_model/video_view_model.dart';

class VideoView extends StatefulWidget {
  static const String id = "video_view";
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  final VideoViewModel videoData = VideoViewModel();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    var dataFromCourseResource =
        ModalRoute.of(context)?.settings.arguments as List;
    int categIndex = videoData.checkCategIndex(
      dataFromCourseResource[1].toString(),
    );
    var orientation = MediaQuery.of(context).orientation;
    int levelIndex = videoData.checkLevelIndex(dataFromCourseResource[2]);
    return SafeArea(
      top: orientation == Orientation.portrait ? false : true,
      child: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return Scaffold(
              appBar: orientation == Orientation.portrait
                  ? AppBar(
                      backgroundColor: Colors.redAccent,
                      title: Text(
                        dataFromCourseResource[0].toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      elevation: 1,
                      centerTitle: true,
                    )
                  : null,
              body: snapshot.data == ConnectivityResult.none
                  ? const ErrorImage()
                  : webView(categIndex: categIndex, levelIndex: levelIndex));
        },
      ),
    );
  }

  Widget webView({categIndex, levelIndex}) {
    return Stack(
      children: [
        WebView(
          zoomEnabled: true,
          initialUrl:
              videoData.allLevelsVideosUrl[levelIndex][categIndex].toString(),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ],
    );
  }
}
