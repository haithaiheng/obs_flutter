class CategoriesModel {
  final int? id;
  final String? name;
  final List<Books>? books;

  CategoriesModel({this.id, this.name, this.books});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      name: json['name'],
      books: (json['books'] as List?)?.map((v) => Books.fromJson(v)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'books': books?.map((v) => v.toJson()).toList(),
    };
  }
}

class Books {
  final int? id;
  final String? title;
  final int? authorId;
  final int? categoryId;
  final int? price;
  final double? rating;
  final String? description;
  final String? pdfUrl;
  final String? thumbnail;
  final String? createdAt;
  final String? updatedAt;
  final Author? author;

  Books({
    this.id,
    this.title,
    this.authorId,
    this.categoryId,
    this.price,
    this.rating,
    this.description,
    this.pdfUrl,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.author,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      id: json['id'],
      title: json['title'],
      authorId: json['author_id'],
      categoryId: json['category_id'],
      price: json['price'],
      rating: (json['rating'] as num?)?.toDouble(),
      description: json['description'],
      pdfUrl: json['pdf_url'],
      thumbnail: json['thumbnail'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      author: json['author'] != null ? Author.fromJson(json['author']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author_id': authorId,
      'category_id': categoryId,
      'price': price,
      'rating': rating,
      'description': description,
      'pdf_url': pdfUrl,
      'thumbnail': thumbnail,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'author': author?.toJson(),
    };
  }
}

class Author {
  final int? id;
  final String? name;
  final String? bio;
  final String? createdAt;
  final String? updatedAt;

  Author({this.id, this.name, this.bio, this.createdAt, this.updatedAt});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'bio': bio,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
