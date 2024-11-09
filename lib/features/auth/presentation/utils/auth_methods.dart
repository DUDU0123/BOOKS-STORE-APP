import 'package:books_app/core/enums/enums.dart';
import 'package:books_app/core/utils/message_show_helper.dart';
import 'package:books_app/features/auth/domain/entity/user_entity.dart';
import 'package:books_app/features/auth/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthMethods {
  static void loginOrRegisterUser({
    required PageType pageType,
    required String username,
    required String password,
    required String? confirmPassword,
    required BuildContext context,
  }) {
    if (pageType == PageType.register) {
      if (username.isNotEmpty && password.isNotEmpty) {
        if (confirmPassword != null) {
          if (confirmPassword.isNotEmpty && password == confirmPassword) {
            UserEntity user = UserEntity(
              password: password,
              userName: username,
            );
            context.read<AuthenticationBloc>().add(
                  RegisterUserEvent(
                    userEntity: user,
                  ),
                );
          }
        }
      }else{
        MessageShowhelper.showSnackbar(snackBarContent: 'Enter valid credentials', context: context);
      }
    } else {
      if (username.isNotEmpty && password.isNotEmpty) {
        UserEntity user = UserEntity(
          password: password,
          userName: username,
        );
        context.read<AuthenticationBloc>().add(
              LoginUserEvent(
                userEntity: user,
              ),
            );
      }else{
        MessageShowhelper.showSnackbar(snackBarContent: 'Enter valid credentials', context: context);
      }
    }
  }
}
