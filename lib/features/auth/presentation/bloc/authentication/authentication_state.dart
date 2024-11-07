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
