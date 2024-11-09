import 'dart:async';
import 'dart:developer';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/usecase/add_book_rating_usecase.dart';
import 'package:books_app/features/home/domain/usecase/get_all_books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetAllBooksUseCase _getAllBooksUsecase;
  final AddBookRatingUsecase _addBookRatingUsecase;
  List<BookEntity> _allBooks = [];
  BookBloc({
    required GetAllBooksUseCase getAllBooksUsecase,
    required AddBookRatingUsecase addBookRatingUsecase,
  })  : _getAllBooksUsecase = getAllBooksUsecase,
        _addBookRatingUsecase = addBookRatingUsecase,
        super(BookInitial()) {
    on<GetAllBooksEvent>(getAllBooksEvent);
    on<SearchBookEvent>(searchBookEvent);
    on<AddBookRatingEvent>(addBookRatingEvent);
  }

  FutureOr<void> getAllBooksEvent(
      GetAllBooksEvent event, Emitter<BookState> emit) async {
    emit(BooksLoadingState());
    try {
      final res = await _getAllBooksUsecase(params: event.page);
      res.fold(
        (failure) {
          emit(BooksErrorState(message: failure.message));
        },
        (books) {
          log("I'm in bloc here books $books");
          _allBooks = books;
          emit(BooksLoadedState(bookList: books));
        },
      );
    } catch (e) {
      emit(BooksErrorState(message: e.toString()));
    }
  }

  FutureOr<void> searchBookEvent(
      SearchBookEvent event, Emitter<BookState> emit) {
    try {
      if (event.query.isEmpty) {
        emit(BooksLoadedState(bookList: _allBooks));
      } else {
        final filteredBooks = _allBooks.where((book) {
          if (book.bookTitle == null) {
            emit(BooksLoadedState(bookList: _allBooks));
          }
          return book.bookTitle!
              .toLowerCase()
              .contains(event.query.toLowerCase());
        }).toList();

        emit(BooksLoadedState(bookList: filteredBooks));
      }
    } catch (e) {
      emit(BooksErrorState(message: e.toString()));
    }
  }

  FutureOr<void> addBookRatingEvent(
      AddBookRatingEvent event, Emitter<BookState> emit) async {
    try {
      final res = await _addBookRatingUsecase(
          params: RatingModel(
        starCount: event.startCount,
        bookId: event.bookId,
        userToken: event.userToken,
      ));
      res.fold((failure) {
         emit(BooksErrorState(message: failure.message));
      }, (isRatingAdded) {
        emit(BooksLoadedState(bookList: _allBooks));
      },);
    } catch (e) {
      emit(BooksErrorState(message: e.toString()));
    }
  }
}
