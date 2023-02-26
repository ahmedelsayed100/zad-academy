import 'package:zad_academy/models/level_model.dart';
import 'package:zad_academy/models/material_model.dart';
import 'package:zad_academy/models/subject_model.dart';

final List<LevelModel> levels = [
  LevelModel(
    levelId: 1,
    levelName: "المستوي الأول",
    levelImageUrl: "assets/images/level1.png",
  ),
  LevelModel(
    levelId: 2,
    levelName: "المستوي الثاني",
    levelImageUrl: "assets/images/level2.png",
  ),
  LevelModel(
    levelId: 3,
    levelName: "المستوي الثالث",
    levelImageUrl: "assets/images/level3.png",
  ),
  LevelModel(
    levelId: 4,
    levelName: "المستوي الرابع",
    levelImageUrl: "assets/images/level4.png",
  ),
];

final List<SubjectModel> subjects = [
  SubjectModel(
    subjectId: 1,
    subjectName: "التفسير",
    subjectImageUrl: "assets/images/tafseer_icon.png",
    bookImageUrl: "assets/images/tafseer_book.jpg",
  ),
  SubjectModel(
    subjectId: 2,
    subjectName: "العقيدة",
    subjectImageUrl: "assets/images/aqeedah_icon.png",
    bookImageUrl: "assets/images/aqeedah_book.jpg",
  ),
  SubjectModel(
    subjectId: 3,
    subjectName: "الفقه",
    subjectImageUrl: "assets/images/fiqh_icon.png",
    bookImageUrl: "assets/images/fiqh_book.jpg",
  ),
  SubjectModel(
    subjectId: 4,
    subjectName: "اللغة العربية",
    subjectImageUrl: "assets/images/arabic_icon.png",
    bookImageUrl: "assets/images/arabic_book.jpg",
  ),
  SubjectModel(
    subjectId: 5,
    subjectName: "التربية الإسلامية",
    subjectImageUrl: "assets/images/tarbiyah_icon.png",
    bookImageUrl: "assets/images/tarbiyah_book.jpg",
  ),
  SubjectModel(
    subjectId: 6,
    subjectName: "السيرة النبوية",
    subjectImageUrl: "assets/images/seerah_icon.png",
    bookImageUrl: "assets/images/seerah_book.jpg",
  ),
  SubjectModel(
    subjectId: 7,
    subjectName: "الحديث",
    subjectImageUrl: "assets/images/hadith_icon.png",
    bookImageUrl: "assets/images/hadith_book.jpg",
  ),
];

final List<MaterialModel> materials = [
  MaterialModel(
      materialId: 1,
      materialName: "الكتاب",
      materialImageUrl: "assets/images/book.jpg",
      materialDestination: "book_view"),
  MaterialModel(
      materialId: 2,
      materialName: "مقاطع الفيديو",
      materialImageUrl: "assets/images/video.jpg",
      materialDestination: "video_view"),
  MaterialModel(
      materialId: 3,
      materialName: "الملفات الصوتية",
      materialImageUrl: "assets/images/audio.jpg",
      materialDestination: "audio_view"),
  MaterialModel(
      materialId: 4,
      materialName: "الملخصات",
      materialImageUrl: "assets/images/prefing.png",
      materialDestination: "audio_view"),
];

final List<List<BookModel>> books = [
  [
    BookModel(
      bookId: 1,
      bookName: "",
      bookDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Tafsir/Book/CourseBook_Semester1_AlTafsir.pdf",
    ),
    BookModel(
      bookId: 2,
      bookName: "",
      bookDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Aqeedah/Book/CourseBook_Semester1_AlAqeedah.pdf",
    ),
    BookModel(
      bookId: 3,
      bookName: "",
      bookDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Fiqh/Book/CourseBook_Semester1_Fiqh.pdf",
    ),
    BookModel(
      bookId: 4,
      bookName: "",
      bookDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Arabic/Book/CourseBook_Semester1_ArabicLanguage.pdf",
    ),
    BookModel(
      bookId: 5,
      bookName: "",
      bookDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Tarbiyah/Book/CourseBook_Semester1_AlTarbyiah.pdf",
    ),
    BookModel(
      bookId: 6,
      bookName: "",
      bookDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Seerah/Book/CourseBook_Semester1_Seerah.pdf",
    ),
    BookModel(
      bookId: 7,
      bookName: "bookName",
      bookDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Hadith/Book/CourseBook_Semester1_AlHadith.pdf",
    )
  ]
];

final List<List<VideoModel>> videos = [
  [
    VideoModel(
      videoId: 1,
      videoName: "test",
      videoDownloadUrl:
          "https://resources.zad-academy.com/Semester1/Tafsir/Book/CourseBook_Semester1_AlTafsir.pdf",
    ),
  ]
];
