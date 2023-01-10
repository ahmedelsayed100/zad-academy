class CourseResourceViewModel {
  List resources = [
    "الكتاب",
    "مقاطع الفيديو",
    "الملفات الصوتية",
  ];
  // String url = "";
  int x = 0;
  checkCategIndex(value) {
    switch (value) {
      case "التفسير":
        x = 0;
        break;

      case "العقيدة":
        x = 1;
        break;

      case "الفقه":
        x = 2;
        break;

      case "اللغة العربية":
        x = 3;
        break;

      case "التربية الإسلامية":
        x = 4;
        break;

      case "السيرة النبوية":
        x = 5;
        break;

      case "الحديث":
        x = 6;
        break;
    }
    return x;
  }
}
