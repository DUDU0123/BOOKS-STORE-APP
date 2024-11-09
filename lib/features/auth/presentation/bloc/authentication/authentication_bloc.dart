import 'dart:async';
import 'package:books_app/config/routes/app_routes_name.dart';
import 'package:books_app/config/routes/router.dart';
import 'package:books_app/features/auth/domain/entity/user_entity.dart';
import 'package:books_app/features/auth/domain/usecase/check_user_loggedin_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/login_user_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/logout_user_usecase.dart';
import 'package:books_app/features/auth/domain/usecase/register_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegisterUserUsecase _registerUserUsecase;
  final LoginUserUsecase _loginUserUsecase;
  final CheckUserLoggedinUsecase _checkUserLoggedinUsecase;
  final LogoutUserUsecase _logoutUserUsecase;
  AuthenticationBloc({
    required RegisterUserUsecase registerUserUsecase,
    required LoginUserUsecase loginUserUsecase,
    required CheckUserLoggedinUsecase checkUserLoggedinUsecase,
    required LogoutUserUsecase logoutUserUsecase,
  })  : _registerUserUsecase = registerUserUsecase,
        _loginUserUsecase = loginUserUsecase,
        _logoutUserUsecase = logoutUserUsecase,
        _checkUserLoggedinUsecase = checkUserLoggedinUsecase,
        super(AuthenticationInitial()) {
    on<PasswordVisibilityChangeEvent>(passwordVisibilityChangeEvent);
    on<FieldFocusChangeEvent>(fieldFocusChangeEvent);
    on<RegisterUserEvent>(registerUserEvent);
    on<LoginUserEvent>(loginUserEvent);
    on<LogOutUserEvent>(logOutUserEvent);
    on<CheckUserLoggedInEvent>(checkUserLoggedInEvent);
  }

  FutureOr<void> passwordVisibilityChangeEvent(
      PasswordVisibilityChangeEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(isHided: !state.isHided));
  }

  FutureOr<void> fieldFocusChangeEvent(
      FieldFocusChangeEvent event, Emitter<AuthenticationState> emit) {
    if (event.controller != null) {
      final newFocusStates = {...state.focusStates ?? {}};
      newFocusStates[event.controller!] = event.isFieldFocused;
      emit(state.copyWith(focusStates: newFocusStates));
    }
  }

  FutureOr<void> registerUserEvent(
      RegisterUserEvent event, Emitter<AuthenticationState> emit) async {
        emit(AuthenticationLoadingState());
    try {
      final res = await _registerUserUsecase(params: event.userEntity);
      res.fold(
        (failure) {
          emit(AuthenticationErrorState(message: failure.message));
        },
        (user) {
          emit(AuthenticationSuccessState(userEntity: user, isLoggedIn: true));
        },
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
  }

  FutureOr<void> loginUserEvent(
      LoginUserEvent event, Emitter<AuthenticationState> emit)async {
         emit(AuthenticationLoadingState());
        try {
      final res = await _loginUserUsecase(params: event.userEntity);
      res.fold(
        (failure) {
          emit(AuthenticationErrorState(message: failure.message));
        },
        (user) {
          emit(AuthenticationSuccessState(userEntity: user, isLoggedIn: true));
        },
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
      }

  FutureOr<void> logOutUserEvent(
      LogOutUserEvent event, Emitter<AuthenticationState> emit) async{
        try {
      final res = await _logoutUserUsecase(params: null);
      res.fold(
        (failure) {
          emit(AuthenticationErrorState(message: failure.message));
        },
        (isLoggedOut) {
          event.context.goNamed(AppRoutesName.register);
          add(CheckUserLoggedInEvent());
        },
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
      }

  FutureOr<void> checkUserLoggedInEvent(
      CheckUserLoggedInEvent event, Emitter<AuthenticationState> emit) async{
        try {
      final res = await _checkUserLoggedinUsecase(params: null);
      res.fold(
        (failure) {
          emit(AuthenticationErrorState(message: failure.message));
        },
        (isLoggedIn) {
          emit(AuthenticationSuccessState(isLoggedIn: isLoggedIn));
        },
      );
    } catch (e) {
      emit(AuthenticationErrorState(message: e.toString()));
    }
      }
}
