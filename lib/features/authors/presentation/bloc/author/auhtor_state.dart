part of 'auhtor_bloc.dart';

sealed class AuhtorState extends Equatable {
  const AuhtorState();
  
  @override
  List<Object> get props => [];
}

final class AuhtorInitial extends AuhtorState {}

class AuthorsLoadingState extends AuhtorState{}
class AuthorsLoadedState extends AuhtorState {
  final List<AuthorEntity> authorList;
  const AuthorsLoadedState({
    required this.authorList,
  });
  @override
  List<Object> get props => [authorList,];
}
class AuthorsErrorState extends AuhtorState {
  final String message;
  const AuthorsErrorState({
    required this.message,
  });
  @override
  List<Object> get props => [message,];
}
