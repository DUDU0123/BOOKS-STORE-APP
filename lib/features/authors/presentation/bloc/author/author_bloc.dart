import 'dart:async';
import 'package:books_app/features/authors/domain/entity/author_entity.dart';
import 'package:books_app/features/authors/domain/usecase/get_all_authors_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final GetAllAuthorsUsecase _getAllAuthorsUsecase;
  AuthorBloc({
    required GetAllAuthorsUsecase getAllAuthorsUsecase,
  })  : _getAllAuthorsUsecase = getAllAuthorsUsecase,
        super(AuhtorInitial()) {
    on<GetAllAuthorsEvent>(getAllAuthorsEvent);
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
          emit(AuthorsLoadedState(authorList: authorList));
        },
      );
    } catch (e) {
      emit(AuthorsErrorState(message: e.toString()));
    }
  }
}
