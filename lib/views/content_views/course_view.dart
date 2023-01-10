import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:zad_academy/hub/widgets/common_code.dart';

import '../ads_views/interesitial_ads.dart';
import '../../viewModels/content_view_model/course_view_model.dart';

class CourseView extends StatefulWidget {
  static String id = "course_view";
  const CourseView({Key? key}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final courseData = CourseViewModel();
  final interAd = InterstitialAdMobView();
  @override
  void initState() {
    interAd.createAd();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    var dataFromCategory = ModalRoute.of(context)?.settings.arguments as List;
    String levelName = dataFromCategory[1];

    return Scaffold(
      appBar: popularAppBar(title: dataFromCategory[0].toString()),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          newMethod(dataFromCategory, levelName, orientation),
        ],
      ),
    );
  }

  GridView newMethod(
      List<dynamic> dataFromCategory, String levelName, orientation) {
    return GridView.builder(
        padding: const EdgeInsets.all(4),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: orientation == Orientation.landscape ? 16 / 4 : 2,
          crossAxisSpacing: 2,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              elevation: 8,
              margin: EdgeInsets.symmetric(
                horizontal: returnWidth(context) * 0.008,
                vertical: returnHeight(context) * 0.01,
              ),
              child: GridTile(
                footer: Container(
                  color: Colors.amber,
                  child: AutoSizeText(
                    courseData.resources[index],
                    textAlign: TextAlign.center,
                    presetFontSizes: const [22, 21, 20],
                    textScaleFactor: 1,
                  ),
                ),
                child: Image.asset(
                  courseData.resourcesImage[index],
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            onTap: () {
              switch (index) {
                case 0:
                  interAd.showAd();
                  Navigator.of(context).pushNamed(
                    courseData.resourceDestinations[index],
                    arguments: [
                      courseData.resources[index],
                      dataFromCategory[index],
                      levelName,
                    ],
                  );

                  break;
                case 1:
                  interAd.showAd();
                  Navigator.of(context).pushNamed(
                    courseData.resourceDestinations[index],
                    arguments: [
                      courseData.resources[index],
                      dataFromCategory[0],
                      levelName,
                    ],
                  );

                  break;
                case 2:
                  interAd.showAd();
                  Navigator.of(context).pushNamed(
                    courseData.resourceDestinations[index],
                    arguments: [
                      courseData.resources[index],
                      dataFromCategory[0],
                      levelName,
                    ],
                  );

                  break;
              }
            },
          );
        });
  }
}
