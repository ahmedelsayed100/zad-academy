import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zad_academy/hub/widgets/common_code.dart';

import '../../hub/constant_values.dart';
import '../ads_views/interesitial_ads.dart';
import '../../viewModels/main_views_model/drawer_view_model.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final drawerData = DrawerViewModel();

  final interAd = InterstitialAdMobView();
  @override
  void initState() {
    interAd.createAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.zero,
      child: SizedBox(
        width: returnWidth(context) * 0.75,
        child: Drawer(
          elevation: 5,
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: returnWidth(context) * 0.01,
                  vertical: returnHeight(context) * 0.019,
                ),
                color: Colors.amber[600],
                child: AutoSizeText(
                  drawerData.pagesNames[0].toString(),
                  style: const TextStyle(
                      fontSize: 22, color: ConstantValues.bkColor),
                  textAlign: TextAlign.center,
                ),
              ),
              listTileItem(
                //this is for main page
                title: drawerData.pagesNames[1].toString(),
                icon: drawerData.pagesIcons[0],
                func: () => drawerData.navPop(context: context),
              ),
              listTileItem(
                  //this is for academy link
                  title: drawerData.pagesNames[2].toString(),
                  icon: drawerData.pagesIcons[1],
                  func: () {
                    interAd.showAd();
                    drawerData.navPush(
                      context: context,
                      dest: "academy_site_view",
                    );
                  }),
              listTileItem(
                //this is for terms and privacy
                title: drawerData.pagesNames[3].toString(),
                icon: drawerData.pagesIcons[2],
                func: () {
                  drawerData.navPush(
                    context: context,
                    dest: "terms_privacy_view",
                  );
                },
              ),
              listTileItem(
                //this is for about app
                title: drawerData.pagesNames[4].toString(),
                icon: drawerData.pagesIcons[3],
                func: () {
                  drawerData.navPush(
                    context: context,
                    dest: "about_app_view",
                  );
                },
              ),
              listTileItem(
                //this is for about app
                title: drawerData.pagesNames[5].toString(),
                icon: drawerData.pagesIcons[4],
                func: () {
                  Share.share(
                    "يمكنك تحميل تطبيق أكاديمية زاد عن طريق هذا الرابط : ${drawerData.appUrl}",
                    subject: "مشاركة التطبيق",
                  );
                },
              ),
              listTileItem(
                //this is for about app
                title: drawerData.pagesNames[6].toString(),
                icon: drawerData.pagesIcons[5],
                func: () async {
                  try {
                    await launchUrlString(
                        "https://play.google.com/store/apps/developer?id=Ahmed+Moukhtar");
                  } catch (e) {
                    // print(e.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
