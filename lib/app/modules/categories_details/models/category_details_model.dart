class CategoryDetailsModel {
  final int bookId;
  final String bookTitle;
  final String bookFile;
  final String bookGenre;
  final String bookThumbnail;

  CategoryDetailsModel({
    required this.bookId,
    required this.bookTitle,
    required this.bookFile,
    required this.bookGenre,
    required this.bookThumbnail,
  });

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailsModel(
      bookId: int.tryParse(json['book_id'].toString()) ?? 0,
      bookTitle: json['book_title'] as String,
      bookFile: json['book_file'] as String,
      bookGenre: json['book_genre'] as String? ?? "",
      // Default empty string
      bookThumbnail: json['book_thumbnail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book_id': bookId,
      'book_title': bookTitle,
      'book_file': bookFile,
      'book_genre': bookGenre,
      'book_thumbnail': bookThumbnail,
    };
  }

  @override
  String toString() {
    return 'CategoryDetailsModel(bookId: $bookId, bookTitle: $bookTitle, bookFile: $bookFile, bookGenre: $bookGenre, bookThumbnail: $bookThumbnail)';
  }
}
