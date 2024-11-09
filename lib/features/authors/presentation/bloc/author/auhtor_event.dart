part of 'auhtor_bloc.dart';

sealed class AuhtorEvent extends Equatable {
  const AuhtorEvent();

  @override
  List<Object> get props => [];
}
class GetAllAuthorsEvent extends AuhtorEvent{

  
}