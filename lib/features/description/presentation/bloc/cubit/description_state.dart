part of 'description_cubit.dart';

class DescriptionState extends Equatable {
  const DescriptionState(
    {this.starCount = 0,}
  );
  final int starCount;

  DescriptionState copyWith({int? starCount,}){
    return DescriptionState(starCount: starCount??this.starCount);
  }

  @override
  List<Object> get props => [starCount];
}

final class DescriptionInitial extends DescriptionState {}
