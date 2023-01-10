class BookViewModel {
  final allLevelsBooksUrl = [
    //semester 1 -- done
    [
      "https://resources.zad-academy.com/Semester1/Tafsir/Book/CourseBook_Semester1_AlTafsir.pdf",
      "https://resources.zad-academy.com/Semester1/Aqeedah/Book/CourseBook_Semester1_AlAqeedah.pdf",
      "https://resources.zad-academy.com/Semester1/Fiqh/Book/CourseBook_Semester1_Fiqh.pdf",
      "https://resources.zad-academy.com/Semester1/Arabic/Book/CourseBook_Semester1_ArabicLanguage.pdf",
      "https://resources.zad-academy.com/Semester1/Tarbiyah/Book/CourseBook_Semester1_AlTarbyiah.pdf",
      "https://resources.zad-academy.com/Semester1/Seerah/Book/CourseBook_Semester1_Seerah.pdf",
      "https://resources.zad-academy.com/Semester1/Hadith/Book/CourseBook_Semester1_AlHadith.pdf",
    ],
    //semester 2 -- done
    [
      "https://archive.org/download/zad-acdmy-L2/Tafsir-S2.pdf",
      "https://archive.org/download/zad-acdmy-L2/Aqeda-S2.pdf",
      "https://archive.org/download/zad-acdmy-L2/Fiqh-S2.pdf",
      "https://archive.org/download/zad-acdmy-L2/Arbc-S2.pdf",
      "https://archive.org/download/zad-acdmy-L2/Trbyh-S2.pdf",
      "https://archive.org/download/zad-acdmy-L2/Serah-S2.pdf",
      "https://archive.org/download/zad-acdmy-L2/Hadith-S2.pdf",
    ],
    //semester 3 -- waiting
    [
      "https://archive.org/download/zad-academy-books/coursebook_semester3_altafsir.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester3_alaqeedah.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester3_fiqh.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester3_arabiclanguage.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester3_altarbyiah.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester3_seerah.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester3_alhadith.pdf",
    ],
    //semester 4 -- waiting
    [
      "https://archive.org/download/zad-academy-books/coursebook_semester4_altafsir.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester4_alaqeedah.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester4_fiqh.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester4_arabiclanguage.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester4_altarbyiah.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester4_seerah.pdf",
      "https://archive.org/download/zad-academy-books/coursebook_semester4_alhadith.pdf",
    ]
  ];

  final List categoryImage = [
    "assets/images/tafseer_book.jpg",
    "assets/images/aqeedah_book.jpg",
    "assets/images/fiqh_book.jpg",
    "assets/images/arabic_book.jpg",
    "assets/images/tarbiyah_book.jpg",
    "assets/images/seerah_book.jpg",
    "assets/images/hadith_book.jpg",
  ];
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
