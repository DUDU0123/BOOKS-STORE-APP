import 'package:books_app/core/constants/database_constants.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';

class BookModel extends BookEntity {
  final String id;
  final String title;
  final String description;
  final DateTime publishedDate;
  final String authorId;
  final String coverPictureURL;
  final int price;
  final List<dynamic> ratings;
  final int starCount;

  const BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.publishedDate,
    required this.authorId,
    required this.coverPictureURL,
    required this.price,
    required this.ratings,
    required this.starCount,
  }) : super(
          bookAuthorId: authorId,
          bookId: id,
          bookCoverPictureURL: coverPictureURL,
          bookDescription: description,
          bookPrice: price,
          bookPublishedDate: publishedDate,
          bookStarCount: starCount,
          bookRatings: ratings,
          bookTitle: title,
        );

  // fromJson factory method
  factory BookModel.fromJson({required Map<String, dynamic> json,}) {
    return BookModel(
      id: json[dbBookId] as String,
      title: json[dbBookTitle] as String,
      description: json[dbBookDescription] as String,
      publishedDate: DateTime.parse(json[dbPublishedDate] as String),
      authorId: json[dbAuthorId] as String,
      coverPictureURL: json[dbCoverPictureURL] as String,
      price: json[dbPrice] as int,
      ratings: List<dynamic>.from(json[dbRatings] as List<dynamic>),
      starCount: json[dbStarCount] as int,
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      dbBookId: id,
      dbBookTitle: title,
      dbBookDescription: description,
      dbPublishedDate: publishedDate.toIso8601String(),
      dbAuthorId: authorId,
      dbCoverPictureURL: coverPictureURL,
      dbPrice: price,
      dbRatings: ratings,
      dbStarCount: starCount,
    };
  }

  // copyWith method
  BookModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? publishedDate,
    String? authorId,
    String? coverPictureURL,
    int? price,
    List<dynamic>? ratings,
    int? starCount,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      publishedDate: publishedDate ?? this.publishedDate,
      authorId: authorId ?? this.authorId,
      coverPictureURL: coverPictureURL ?? this.coverPictureURL,
      price: price ?? this.price,
      ratings: ratings ?? this.ratings,
      starCount: starCount ?? this.starCount,
    );
  }
}
