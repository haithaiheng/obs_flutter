class BookDetailsModel {
  final int bookId;
  final String bookTitle;
  final String bookDesc;
  final String bookFile;
  final String bookThumbnail;
  final double bookPrice;
  final String bookGenre;
  final int bookFeature;
  final int categoryId;
  final String cateTitle;
  final int typeId;
  final String typeTitle;
  final String bookCreateAt;
  final int bookStatus;
  final double bookRate;
  final List<Comments> comments;

  BookDetailsModel({
    required this.bookId,
    required this.bookTitle,
    required this.bookDesc,
    required this.bookFile,
    required this.bookThumbnail,
    required this.bookPrice,
    required this.bookGenre,
    required this.bookFeature,
    required this.categoryId,
    required this.cateTitle,
    required this.typeId,
    required this.typeTitle,
    required this.bookCreateAt,
    required this.bookStatus,
    required this.bookRate,
    required this.comments,
  });

  // Factory method to parse JSON
  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookDetailsModel(
      bookId: _parseInt(json['book_id']),
      bookTitle: json['book_title'] ?? '',
      bookDesc: json['book_desc'] ?? '',
      bookFile: json['book_file'] ?? '',
      bookThumbnail: json['book_thumbnail'] ?? '',
      bookPrice: double.tryParse(json['book_price'].toString()) ?? 0.0,
      bookGenre: json['book_genre'] ?? '',
      bookFeature: _parseInt(json['book_feature']),
      categoryId: _parseInt(json['category_id']),
      cateTitle: json['cate_title'] ?? '',
      typeId: _parseInt(json['type_id']),
      typeTitle: json['type_title'] ?? '',
      bookCreateAt: json['book_createat'] ?? '',
      bookStatus: _parseInt(json['book_status']),
      bookRate: double.tryParse(json['book_rate'].toString()) ?? 0.0,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((comment) =>
                  Comments.fromJson(comment as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  static int _parseInt(dynamic value) {
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return value ?? 0;
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = bookId;
    data['book_title'] = bookTitle;
    data['book_desc'] = bookDesc;
    data['book_file'] = bookFile;
    data['book_thumbnail'] = bookThumbnail;
    data['book_price'] = bookPrice;
    data['book_genre'] = bookGenre;
    data['book_feature'] = bookFeature;
    data['category_id'] = categoryId;
    data['cate_title'] = cateTitle;
    data['type_id'] = typeId;
    data['type_title'] = typeTitle;
    data['book_createat'] = bookCreateAt;
    data['book_status'] = bookStatus;
    data['book_rate'] = bookRate;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }

    // return {
    //   'book_id': bookId,
    //   'book_title': bookTitle,
    //   'book_desc': bookDesc,
    //   'book_file': bookFile,
    //   'book_thumbnail': bookThumbnail,
    //   'book_price': bookPrice,
    //   'book_genre': bookGenre,
    //   'book_feature': bookFeature,
    //   'category_id': categoryId,
    //   'cate_title': cateTitle,
    //   'type_id': typeId,
    //   'type_title': typeTitle,
    //   'book_createat': bookCreateAt,
    //   'book_status': bookStatus,
    //   'book_rate': bookRate,
    //   'comments': comments,
    // };
    return data;
  }

  // Override toString() to print the details of the book
  @override
  String toString() {
    return 'BookDetailsModel{bookId: $bookId, bookTitle: $bookTitle, bookDesc: $bookDesc, bookFile: $bookFile, bookThumbnail: $bookThumbnail, bookPrice: $bookPrice, bookGenre: $bookGenre, bookFeature: $bookFeature, categoryId: $categoryId, cateTitle: $cateTitle, typeId: $typeId, typeTitle: $typeTitle, bookCreateAt: $bookCreateAt, bookStatus: $bookStatus, bookRate: $bookRate, comments: $comments}';
  }
}

class Comments {
  String? comId;
  String? comDate;
  String? comText;
  String? userId;
  String? userFirstname;

  Comments(
      {this.comId,
      this.comDate,
      this.comText,
      this.userId,
      this.userFirstname});

  Comments.fromJson(Map<String, dynamic> json) {
    comId = json['com_id'];
    comDate = json['com_date'];
    comText = json['com_text'];
    userId = json['user_id'];
    userFirstname = json['user_firstname'];
  }

  Map<String, dynamic> toJson() {
    return {
      'com_id': comId,
      'com_date': comDate,
      'com_text': comText,
      'user_id': userId,
      'user_firstname': userFirstname,
    };
  }

  // ✅ Override toString()
  @override
  String toString() {
    return 'Comments(comId: $comId, comDate: $comDate, comText: $comText, userId: $userId, userFirstname: $userFirstname)';
  }
}
