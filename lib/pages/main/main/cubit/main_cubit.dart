import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState());

  void onLoadingUserChanged(bool status) {
    emit(state.copyWith(loadingUserSuccesfull: status));
  }

  void onLoadingBrandChanged(bool status) {
    emit(state.copyWith(loadingBrandSuccesfull: status));
  }

  void onLoadingStoresChanged(bool status) {
    emit(state.copyWith(loadingStoresSuccesfull: status));
  }

  void onLoadingSkillsChanged(bool status) {
    emit(state.copyWith(loadingSkillsSuccesfull: status));
  }

  void onLoadingFailure() =>
      emit(state.copyWith(mainStatus: MainStatus.loadingFailure));

  void onInit() => emit(MainState());
}
