import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? password;
  final String? jwtToken;
  const UserEntity({
    this.userId,
    this.userName,
    this.password,
    this.jwtToken,
  });

  @override
  List<Object?> get props => [
        userId,
        userName,
        password,
        jwtToken,
      ];
}
