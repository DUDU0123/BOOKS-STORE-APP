import 'dart:async';
import 'dart:developer';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:books_app/features/home/domain/usecase/get_all_books.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetAllBooksUseCase _getAllBooksUsecase;
  BookBloc({
    required GetAllBooksUseCase getAllBooksUsecase,
  })  : _getAllBooksUsecase = getAllBooksUsecase,
        super(BookInitial()) {
    on<GetAllBooksEvent>(getAllBooksEvent);
  }

  FutureOr<void> getAllBooksEvent(
      GetAllBooksEvent event, Emitter<BookState> emit) async {
        emit(BooksLoadingState());
    try {
      final res = await _getAllBooksUsecase(params: null);
      res.fold(
        (failure) {
          emit(BooksErrorState(message: failure.message));
        },
        (books) {
          log("I'm in bloc here books $books");
          emit(BooksLoadedState(bookList: books));
        },
      );
    } catch (e) {
      emit(BooksErrorState(message: e.toString()));
    }
  }
}
