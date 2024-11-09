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
class RegisterUserEvent extends AuthenticationEvent {
  final UserEntity userEntity;
  RegisterUserEvent({
    required this.userEntity,
  });
  @override
  List<Object?> get props => [userEntity,];
}
class LoginUserEvent extends AuthenticationEvent {
  final UserEntity userEntity;
  LoginUserEvent({
    required this.userEntity,
  });
  @override
  List<Object?> get props => [userEntity,];
}
class LogOutUserEvent extends AuthenticationEvent {
  final BuildContext context;
  LogOutUserEvent({
    required this.context,
  });
  @override
  List<Object?> get props => [context];
}
class CheckUserLoggedInEvent extends AuthenticationEvent{}