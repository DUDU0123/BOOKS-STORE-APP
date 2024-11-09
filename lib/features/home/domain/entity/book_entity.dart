import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String? bookId;
  final String? bookTitle;
  final String? bookDescription;
  final DateTime? bookPublishedDate;
  final String? bookAuthorId;
  final String? bookCoverPictureURL;
  final int? bookPrice;
  final List<dynamic>? bookRatings;
  final int? bookStarCount;
  const BookEntity({
    this.bookId,
    this.bookTitle,
    this.bookDescription,
    this.bookPublishedDate,
    this.bookAuthorId,
    this.bookCoverPictureURL,
    this.bookPrice,
    this.bookRatings,
    this.bookStarCount,
  });

  @override
  List<Object?> get props {
    return [
      bookId,
      bookTitle,
      bookDescription,
      bookPublishedDate,
      bookAuthorId,
      bookCoverPictureURL,
      bookPrice,
      bookRatings,
      bookStarCount,
    ];
  }
}
