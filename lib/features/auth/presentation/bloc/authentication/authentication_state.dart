part of 'authentication_bloc.dart';

@immutable
class AuthenticationState extends Equatable {
  final bool isHided;
  final Map<TextEditingController, bool>? focusStates;
  const AuthenticationState({
    this.isHided = true,
    this.focusStates,
  });
  AuthenticationState copyWith({
    bool? isHided,
    Map<TextEditingController, bool>? focusStates,
  }) {
    return AuthenticationState(
      isHided: isHided ?? this.isHided,
      focusStates: focusStates ?? this.focusStates,
    );
  }

  @override
  List<Object?> get props => [
        isHided,
        focusStates,
      ];
}

final class AuthenticationInitial extends AuthenticationState {}
class AuthenticationLoadingState extends AuthenticationState {}
class AuthenticationSuccessState extends AuthenticationState {
  final UserEntity? userEntity;
  final bool? isLoggedIn;
  const AuthenticationSuccessState({
    this.userEntity,this.isLoggedIn
  });
  @override
  List<Object?> get props => [userEntity,isLoggedIn];
}
class AuthenticationErrorState extends AuthenticationState {
  final String message;
  const AuthenticationErrorState({
    required this.message,
  });
  @override
  List<Object?> get props => [message,];
}
