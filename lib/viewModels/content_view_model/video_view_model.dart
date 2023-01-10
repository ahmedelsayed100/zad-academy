class VideoViewModel {
  //  "التفسير",
  //   "العقيدة",
  //   "الفقه",
  //   "اللغة العربية",
  //   "التربية الإسلامية",
  //   "السيرة النبوية",
  //   "الحديث",
  final allLevelsVideosUrl = [
    ///sem 1
    [
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkmj2gez4thmXwQIFlIvnzEJ",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkl7KwlnPWXpt7U4qdIUu7b0",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgknH9jBm_K5Pv0uqQwqmNJgV",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkk6dJn1Rp18CrAfqyw_BF7Q",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkl0fu6RFd8617GzpIwePssi",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkl_Z9cKjLHYzz3-b9asxWGS",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkmNiXjr0-FZyl7gPEx2FVnh",
    ],

    ///sem 2

    [
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkkKpwT-1IxkhAqU4COR2JzU",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkkPlfFKfI7tp3t28Mr4nAhP",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkmyeq7I3L8A4Yyru0EoCsNF",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgklQosVroVr0XGaeAiMATYvB",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgklunsenYmfytjvalLMxO7vb",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkkt18P4st5dwYTDbYoQwgWK",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgklGVN1O7_6vIafX4x71RFK7",
    ],

    ///sem 3

    [
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkkXuHu3bEZYVTykQtG-N8O_",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgknuNm8Y8VmDlh2lPGJ1eA4r",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkm7wcQ7pvSSApu6MsvEiZNi",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkn1RJVn7uCpak5LpXy6C5Wr",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgklVit8Zc5K6sgNTJugWGq01",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgklbYeZoO_4AonyI9wiAVkM7",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkmoyaLZ2EYXDazrpmtmSPCy",
    ],

    ///sem 4

    [
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkncmMG2s-hxsKyWKktJdFUW",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgknNAJbXhtk9y-nJX-LAEfut",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgknIoCj61PibwMFds4533l5H",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgknGwH5LuV_1k1ht-iK3PyQT",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkkqGBdcsQDWDvKcoLAMjpDG",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkkA4Dl3NQDCl0aYv6Safx0O",
      "https://www.youtube.com/playlist?list=PLH4NxcjPhgkmctHdxlEaLyGc5Pfw1-FNm",
    ]
  ];
  // int x = 0;
  checkCategIndex(value) {
    switch (value) {
      case "التفسير":
        return 0;
      case "العقيدة":
        return 1;

      case "الفقه":
        return 2;

      case "اللغة العربية":
        return 3;

      case "التربية الإسلامية":
        return 4;

      case "السيرة النبوية":
        return 5;

      case "الحديث":
        return 6;
    }
  }

  checkLevelIndex(value) {
    switch (value) {
      case "المستوي الأول":
        return 0;

      case "المستوي الثاني":
        return 1;

      case "المستوي الثالث":
        return 2;

      case "المستوي الرابع":
        return 3;
    }
  }
}
