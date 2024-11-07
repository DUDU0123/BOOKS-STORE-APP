part of 'theme_manager_cubit.dart';

class ThemeManagerState extends Equatable {
  const ThemeManagerState({
    this.themeMode = ThemeMode.light,
  });
  final ThemeMode themeMode;

  ThemeManagerState copyWith({
    ThemeMode? themeMode,
  }){
    return ThemeManagerState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object> get props => [themeMode];
}

final class ThemeManagerInitial extends ThemeManagerState {}
