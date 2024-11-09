import 'dart:async';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';
import 'package:books_app/features/authors/domain/usecase/get_all_authors_usecase.dart';
import 'package:books_app/features/authors/domain/usecase/get_one_author_usecase.dart';
import 'package:books_app/features/home/domain/entity/book_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final GetAllAuthorsUsecase _getAllAuthorsUsecase;
  List<AuthorEntity> _authors = [];
  final GetOneAuthorUsecase _getOneAuthorUsecase;
  AuthorBloc({
    required GetAllAuthorsUsecase getAllAuthorsUsecase,
    required GetOneAuthorUsecase getOneAuthorUsecase,
  })  : _getAllAuthorsUsecase = getAllAuthorsUsecase,
        _getOneAuthorUsecase = getOneAuthorUsecase,
        super(AuhtorInitial()) {
    on<GetAllAuthorsEvent>(getAllAuthorsEvent);
    on<GetOneAuthorEvent>(getOneAuthorEvent);
  }

  FutureOr<void> getAllAuthorsEvent(
      GetAllAuthorsEvent event, Emitter<AuthorState> emit) async {
    try {
      final res = await _getAllAuthorsUsecase(params: null);
      res.fold(
        (failure) {
          emit(AuthorsErrorState(message: failure.message));
        },
        (authorList) {
          _authors = authorList;
          emit(AuthorsLoadedState(authorList: authorList));
        },
      );
    } catch (e) {
      emit(AuthorsErrorState(message: e.toString()));
    }
  }
  Future<void> getOneAuthorEvent(
    GetOneAuthorEvent event, Emitter<AuthorState> emit) async {
  try {
    final res = await _getOneAuthorUsecase(params: event.authorId);
    res.fold(
      (failure) {
        emit(AuthorsErrorState(message: failure.message));
      },
      (author) {
        // Check the current state and preserve the existing authorMap
        final currentMap = state is AuthorsLoadedState
            ? (state as AuthorsLoadedState).authorMap ?? {}
            : {};

        // Create a new map with the updated entry
        final updatedAuthorMap = Map<String, AuthorEntity>.from(currentMap)
          ..[event.bookId] = author;

        emit(AuthorsLoadedState(authorList: [], authorMap: updatedAuthorMap));
      },
    );
  } catch (e) {
    emit(AuthorsErrorState(message: e.toString()));
  }
}

}
