import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';
import '../../hub/widgets/common_code.dart';
import '../../hub/widgets/repeated_data.dart';
import '../../viewModels/main_views_model/home_view_model.dart';
import '../ads_views/ad_mob_view.dart';
import 'drawer_view.dart';

class HomePageView extends StatefulWidget {
  static String id = "home_page_view";
  const HomePageView({Key? key}) : super(key: key);
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final homeData = HomeViewModel();
  final List levelsImage = const [
    "assets/images/level1.png",
    "assets/images/level2.png",
    "assets/images/level3.png",
    "assets/images/level4.png",
  ];
  void _upgrader() async {
    final newVersion = NewVersion(androidId: "com.tech.zad_academy");
    final status = await newVersion.getVersionStatus();
    status!.canUpdate
        ? newVersion.showUpdateDialog(
            context: context,
            versionStatus: status,
            dialogTitle: "تحديث",
            allowDismissal: true,
            dismissButtonText: "التحديث لاحقاً",
            updateButtonText: "التحديث الآن",
            dialogText: "يتوفر نسخة جديدة من تطبيق أكاديمية زاد",
            dismissAction: () => Navigator.of(context).pop(),
          )
        : null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _upgrader();
    var orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: popularAppBar(title: homeData.title),
        backgroundColor: Colors.blueGrey[50],
        body: Stack(
          children: [
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  borderOnForeground: true,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: orientation == Orientation.landscape
                        ? BorderRadius.circular(returnWidth(context) * 0.02)
                        : BorderRadius.circular(returnWidth(context) * 0.04),
                  ),
                  margin: orientation == Orientation.landscape
                      ? EdgeInsets.all(returnWidth(context) * 0.01)
                      : EdgeInsets.all(returnWidth(context) * 0.022),
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Image.asset(
                            levelsImage[index],
                            fit: BoxFit.fill,
                            height: orientation == Orientation.landscape
                                ? returnHeight(context) * 0.4
                                : returnHeight(context) * 0.2,
                          ),
                        ),
                        buildHeightSpace(context: context, highValue: 0.03),
                        Expanded(
                          flex: 1,
                          child: AutoSizeText(
                            homeData.levelCard[index][0].toString(),
                            maxLines: 1,
                            presetFontSizes: const [30, 28, 26],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ConstantValues.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        "categories_view",
                        arguments: [homeData.levels[index]],
                      );
                    },
                  ),
                );
              },
            ),
            const AdMobView(),
          ],
        ),
        endDrawer: const MainDrawer(),
      ),
    );
  }
}
