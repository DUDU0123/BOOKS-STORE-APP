import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'description_state.dart';

class DescriptionCubit extends Cubit<DescriptionState> {
  DescriptionCubit() : super(DescriptionInitial());
  void setStarCount({required int count}){
    emit(state.copyWith(starCount: count));
  }
}
