import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<PasswordVisibilityChangeEvent>(passwordVisibilityChangeEvent);
    on<FieldFocusChangeEvent>(fieldFocusChangeEvent);
  }

  FutureOr<void> passwordVisibilityChangeEvent(
      PasswordVisibilityChangeEvent event, Emitter<AuthenticationState> emit) {
    emit(state.copyWith(isHided: !state.isHided));
  }

  FutureOr<void> fieldFocusChangeEvent(FieldFocusChangeEvent event, Emitter<AuthenticationState> emit) {
    if (event.controller!=null) {
      final newFocusStates = {...state.focusStates??{}};
      newFocusStates[event.controller!] = event.isFieldFocused;
      emit(state.copyWith(focusStates: newFocusStates));
    }
  }
}
