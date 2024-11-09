part of 'author_bloc.dart';

sealed class AuthorState extends Equatable {
  const AuthorState();
  
  @override
  List<Object> get props => [];
}

final class AuhtorInitial extends AuthorState {}

class AuthorsLoadingState extends AuthorState{}
class AuthorsLoadedState extends AuthorState {
  final List<AuthorEntity> authorList;
  const AuthorsLoadedState({
    required this.authorList,
  });
  @override
  List<Object> get props => [authorList,];
}
class AuthorsErrorState extends AuthorState {
  final String message;
  const AuthorsErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message,];
}
