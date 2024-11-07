part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class PasswordVisibilityChangeEvent extends AuthenticationEvent{}
class FieldFocusChangeEvent extends AuthenticationEvent {
  final bool isFieldFocused;
  final TextEditingController? controller;
  FieldFocusChangeEvent({
    required this.isFieldFocused,required this.controller,
  });
  @override
  List<Object?> get props => [isFieldFocused,controller,];
}
