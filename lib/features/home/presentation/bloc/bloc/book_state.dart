part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();
  
  @override
  List<Object> get props => [];
}

final class BookInitial extends BookState {}
class BooksLoadingState extends BookState{}
class BooksLoadedState extends BookState {
  final List<BookEntity> bookList;
  const BooksLoadedState({
    required this.bookList,
  });
  @override
  List<Object> get props => [bookList,];
}
class BooksErrorState extends BookState {
  final String message;
  const BooksErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message,];
}
