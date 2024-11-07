import 'package:books_app/core/constants/app_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_manager_state.dart';

class ThemeManagerCubit extends Cubit<ThemeManagerState> {
  ThemeManagerCubit() : super(ThemeManagerInitial()){
    getTheme();
  }
  Future<void> changeTheme() async {
    final newThemeMode = state.themeMode == ThemeMode.light? ThemeMode.dark:ThemeMode.light;
    emit(state.copyWith(themeMode: newThemeMode));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isDarkMode, newThemeMode == ThemeMode.dark);
  }

  void getTheme()async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    final bool isDark = sharedPrefs.getBool(isDarkMode)??false;
    emit(state.copyWith(themeMode: isDark?ThemeMode.dark:ThemeMode.light));
  }


}
