part of 'author_bloc.dart';

sealed class AuthorEvent extends Equatable {
  const AuthorEvent();

  @override
  List<Object> get props => [];
}
class GetAllAuthorsEvent extends AuthorEvent{

  
}
class GetOneAuthorEvent extends AuthorEvent {
  final String authorId;
  final String bookId;
  const GetOneAuthorEvent({
    required this.authorId,required this.bookId,
  });
  @override
  List<Object> get props => [authorId,bookId,];
}
