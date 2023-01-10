import 'package:flutter/material.dart';
import '../../hub/widgets/common_code.dart';
import '../../hub/widgets/repeated_data.dart';
import '../../viewModels/main_views_model/terms_privacy_view_model.dart';

class TermsPrivacyView extends StatelessWidget {
  static String id = "terms_privacy_view";
  TermsPrivacyView({Key? key}) : super(key: key);

  final termsPrivacyData = TermsPrivacyViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: popularAppBar(title: termsPrivacyData.title),
        backgroundColor: ConstantValues.whiteColor,
        body: ListView(
          padding: EdgeInsets.all(returnHeight(context) * 0.012),
          children: [
            Image.asset(imagesPath['header_image'].toString()),
            SizedBox(
              height: returnHeight(context) * 0.01,
            ),
            buildcontnetAutoSizeText(contnet: termsPrivacyData.content),
          ],
        ),
      ),
    );
  }
}
