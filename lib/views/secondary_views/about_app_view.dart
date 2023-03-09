import 'package:flutter/material.dart';
import 'package:zad_academy/hub/widgets/app_theme.dart';
import 'package:zad_academy/hub/widgets/common_code.dart';
import '../../hub/constant_values.dart';
import '../../hub/widgets/repeated_data.dart';
import '../../viewModels/main_views_model/about_app_view_model.dart';

class AboutAppView extends StatefulWidget {
  static String id = "about_app_view";

  const AboutAppView({Key? key}) : super(key: key);

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  final aboutAppView = AboutAppViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: popularAppBar(title: aboutAppView.title),
        backgroundColor: ConstantValues.whColor,
        body: ListView(
          padding: EdgeInsets.all(returnHeight(context) * 0.012),
          children: [
            Image.asset(imagesPath['header_image'].toString()),
            buildHeightSpace(context: context, highValue: 0.01),
            Text(
              aboutAppView.basmala.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: selectedFontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
            buildcontnetAutoSizeText(contnet: aboutAppView.messageOfAcademy),
            buildcontnetAutoSizeText(contnet: aboutAppView.goalOfAcademy),
            buildcontnetAutoSizeText(contnet: aboutAppView.content),
            Text(
              aboutAppView.end,
              style: const TextStyle(
                fontFamily: selectedFontFamily,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: returnHeight(context) * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
