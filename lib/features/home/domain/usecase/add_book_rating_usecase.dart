import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:books_app/core/error/failure.dart';
import 'package:books_app/core/usecase/usecase.dart';
import 'package:books_app/features/home/domain/repository/book_repo/book_repository.dart';

class AddBookRatingUsecase implements Usecase<bool, RatingModel> {
  final BookRepository bookRepository;
  AddBookRatingUsecase({
    required this.bookRepository,
  });
  @override
  Future<Either<Failure, bool>> call({required RatingModel params}) async {
    return await bookRepository.addBookRating(
      starCount: params.starCount,
      bookId: params.bookId,
    );
  }
}

class RatingModel extends Equatable {
  final int starCount;
  final String bookId;
  const RatingModel({
    required this.starCount,
    required this.bookId,
  });

  @override
  List<Object> get props => [
        starCount,
        bookId,
      ];
}
