import 'package:flutter/material.dart';

import '../../hub/widgets/repeated_data.dart';

class HomeViewModel {
  var nPrcolor = Colors.amber;
  var nSeccolor = ConstantValues.blackColor;
  var lPrcolor = Colors.amber;
  var lSeccolor = Colors.white;
  String title = "أكاديمية زاد";
  final List levels = const [
    "المستوي الأول",
    "المستوي الثاني",
    "المستوي الثالث",
    "المستوي الرابع"
  ];
  // final List levelsImage = const [
  //   "assets/images/level1.png",
  //   "assets/images/level2.png",
  //   "assets/images/level3.png",
  //   "assets/images/level4.png",
  // ];
  final List levelCard = [
    ["#1", imagesPath['level1_image'].toString()],
    ["#2", imagesPath['level2_image'].toString()],
    ["#3", imagesPath['level3_image'].toString()],
    ["#4", imagesPath['level4_image'].toString()],
  ];
  void funToNav({context, destination, arguments}) {
    Navigator.of(context).pushNamed(
      destination,
      arguments: arguments,
    );
  }
}
