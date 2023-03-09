import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zad_academy/data/data_hub.dart';
import 'package:zad_academy/hub/constant_values.dart';

import '../../../hub/widgets/common_code.dart';
import '../../../services/level_provider.dart';

class VideoView extends StatefulWidget {
  static const String id = "video_view";

  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    final myProvider = Provider.of<LevelProvider>(context);
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
                      myProvider.getMaterialData().materialName,
                      style: const TextStyle(color: ConstantValues.whColor),
                    ),
                    elevation: 1,
                    centerTitle: true,
                  )
                : null,
            body: snapshot.data == ConnectivityResult.none
                ? const ErrorImage()
                : webView(url: videos[0][1].videoDownloadUrl),
          );
        },
      ),
    );
  }

  Widget webView({url}) {
    return Stack(
      children: [
        WebView(
          zoomEnabled: true,
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ],
    );
  }
}
