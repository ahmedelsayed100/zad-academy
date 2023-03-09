import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_academy/data/data_hub.dart';
import 'package:zad_academy/services/level_provider.dart';

import '../../hub/constant_values.dart';
import '../../hub/widgets/common_code.dart';
import '../secondary_views/drawer_view.dart';

class HomePageView extends StatelessWidget {
  static String id = "home_page_view";

  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    final levelProvider = Provider.of<LevelProvider>(context);
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: popularAppBar(title: ConstantValues.appTitle),
        backgroundColor: ConstantValues.bgColor,
        body: Stack(
          children: [
            ListView(
              children: levels
                  .map((level) => Card(
                        borderOnForeground: true,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: orientation == Orientation.landscape
                              ? BorderRadius.circular(
                                  returnWidth(context) * 0.02)
                              : BorderRadius.circular(
                                  returnWidth(context) * 0.04),
                        ),
                        margin: orientation == Orientation.landscape
                            ? EdgeInsets.all(returnWidth(context) * 0.01)
                            : EdgeInsets.all(returnWidth(context) * 0.022),
                        child: InkWell(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        returnWidth(context) * 0.02),
                                    bottomLeft: Radius.circular(
                                        returnWidth(context) * 0.02),
                                  ),
                                  child: Image.asset(
                                    level.levelImageUrl,
                                    fit: BoxFit.fill,
                                    height: orientation == Orientation.landscape
                                        ? returnHeight(context) * 0.4
                                        : returnHeight(context) * 0.2,
                                  ),
                                ),
                              ),
                              buildHeightSpace(
                                  context: context, highValue: 0.03),
                              Expanded(
                                flex: 1,
                                child: AutoSizeText(
                                  "#${level.levelId}",
                                  maxLines: 1,
                                  presetFontSizes: const [30, 28, 26],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: ConstantValues.bkColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            levelProvider.getLevelIndex(level.levelId);
                            Navigator.of(context).pushNamed("subject_view");
                          },
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
        endDrawer: const MainDrawer(),
      ),
    );
  }
}
