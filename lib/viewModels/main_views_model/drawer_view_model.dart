import 'package:flutter/material.dart';

class DrawerViewModel {
  final String appUrl =
      "https://play.google.com/store/apps/details?id=com.tech.zad_academy";
  final List<String> pagesNames = const [
    "أكاديمية زاد",
    "القائمة الرئيسية",
    "موقع الأكاديمية",
    "سياسة الإستخدام",
    "حول التطبيق",
    "مشاركة التطبيق",
    "المزيد من التطبيقات",
  ];

  final List<IconData> pagesIcons = const [
    Icons.home_rounded,
    Icons.language,
    Icons.menu_book_outlined,
    Icons.info_outline,
    Icons.share,
    Icons.apps,
  ];

  void navPop({context}) {
    Navigator.of(context).pop();
  }

  void navPush({context, dest}) {
    Navigator.of(context).pushNamed(dest);
  }
}
// "مشاركة التطبيق",
  // "الوضع المظلم",
  // "المزيد من التطبيقات",
  // Icons.share,
  // Icons.dark_mode_outlined,
  // Icons.apps_rounded,

// Share.share('check out my website https://example.com', subject: 'Look what I made!');