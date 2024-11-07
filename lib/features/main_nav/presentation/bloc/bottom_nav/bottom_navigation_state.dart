part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  const BottomNavigationState({this.currentIndex = 0});
  final int currentIndex;
  BottomNavigationState copyWith({
    int? currentIndex,
  }) {
    return BottomNavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [
        currentIndex,
      ];
}

final class BottomNavigationInitial extends BottomNavigationState {}
