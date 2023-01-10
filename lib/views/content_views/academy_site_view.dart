import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../hub/widgets/common_code.dart';
import '../../hub/widgets/repeated_data.dart';

class AcademySiteView extends StatefulWidget {
  static String id = "academy_site_view";
  const AcademySiteView({Key? key}) : super(key: key);

  @override
  State<AcademySiteView> createState() => _AcademySiteViewState();
}

class _AcademySiteViewState extends State<AcademySiteView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: popularAppBar(title: "موقع أكاديمية زاد"),
            backgroundColor: ConstantValues.whiteColor,
            body: snapshot.data == ConnectivityResult.none
                ? const ErrorImage()
                : webView(),
          );
        },
      ),
    );
  }

  Widget webView() {
    return Stack(
      children: [
        WebView(
          initialUrl: "https://www.zad-academy.com/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ],
    );
  }
}
