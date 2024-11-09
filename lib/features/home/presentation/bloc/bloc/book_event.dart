part of 'book_bloc.dart';

sealed class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class GetAllBooksEvent extends BookEvent {
  final int page;
  const GetAllBooksEvent({
    required this.page,
  });
  @override
  List<Object> get props => [page,];
}

class SearchBookEvent extends BookEvent {
  final String query;
  const SearchBookEvent({
    required this.query,
  });
  @override
  List<Object> get props => [
        query,
      ];
}

class AddBookRatingEvent extends BookEvent {
  final int startCount;
  final String bookId;
  final String userToken;
  const AddBookRatingEvent({
    required this.startCount,
    required this.bookId,
    required this.userToken,
  });
  @override
  List<Object> get props => [
        startCount,
        bookId,
        userToken,
      ];
}
