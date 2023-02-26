class MaterialModel {
  final int materialId;
  final String materialName;
  final String materialImageUrl;
  final String materialDestination;

  MaterialModel({
    required this.materialId,
    required this.materialName,
    required this.materialImageUrl,
    required this.materialDestination,
  });
}

class BookModel {
  final int bookId;
  final String bookName;
  final String bookDownloadUrl;

  BookModel({
    required this.bookId,
    required this.bookName,
    required this.bookDownloadUrl,
  });
}

class VideoModel {
  final int videoId;
  final String videoName;
  final String videoDownloadUrl;

  VideoModel({
    required this.videoId,
    required this.videoName,
    required this.videoDownloadUrl,
  });
}
