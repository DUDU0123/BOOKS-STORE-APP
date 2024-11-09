import 'package:books_app/core/constants/database_constants.dart';
import 'package:books_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  // final String? userid;
  final String? username;
  final String? userPassword;
  final String? userToken;
  const UserModel({
    // this.userid,
    this.username,
    this.userPassword,
    this.userToken,
  }) : super(
          jwtToken: userToken,
          password: userPassword,
          // userId: userid,
          userName: username,
        );

   UserModel copyWith({
    String? userid,
    String? username,
    String? userPassword,
    String? userToken,
  }) {
    return UserModel(
      // userid: userid ?? this.userid,
      username: username ?? this.username,
      userPassword: userPassword ?? this.userPassword,
      userToken: userToken ?? this.userToken,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      // userid: json['userid'] as String?,
      username: json[dbUserName] as String?,
      userPassword: json[dbUserPassword] as String?,
      userToken: json[dbUserToken] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'userid': userid,
      dbUserName: username,
      dbUserPassword: userPassword,
      dbUserToken: userToken,
    };
  }

}
