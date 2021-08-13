part of 'main_cubit.dart';

enum MainStatus {
  initial,
  loading,
  loadingSuccess,
  loadingFailure,
}

class MainState extends Equatable {
  final MainStatus status;
  final bool loadingUserSuccesfull;
  final bool loadingBrandSuccesfull;
  final bool loadingSkillsSuccesfull;
  final bool loadingStoresSuccesfull;
  const MainState({
    this.status: MainStatus.initial,
    this.loadingUserSuccesfull: false,
    this.loadingBrandSuccesfull: false,
    this.loadingStoresSuccesfull: false,
    this.loadingSkillsSuccesfull: false,
  });

  MainState copyWith({
    bool loadingUserSuccesfull,
    bool loadingBrandSuccesfull,
    bool loadingSkillsSuccesfull,
    bool loadingStoresSuccesfull,
    MainStatus mainStatus,
  }) {
    bool user = loadingUserSuccesfull ?? this.loadingUserSuccesfull;
    bool brand = loadingBrandSuccesfull ?? this.loadingBrandSuccesfull;
    bool skills = loadingSkillsSuccesfull ?? this.loadingSkillsSuccesfull;
    bool stores = loadingStoresSuccesfull ?? this.loadingStoresSuccesfull;
    MainStatus status = MainStatus.loading;
    if (user == true && brand == true && skills == true && stores == true) {
      status = MainStatus.loadingSuccess;
    }
    MainState mainState = MainState(
      loadingUserSuccesfull: user,
      loadingBrandSuccesfull: brand,
      loadingSkillsSuccesfull: skills,
      loadingStoresSuccesfull: stores,
      status: mainStatus ?? status,
    );
    return mainState;
  }

  getStatus() =>
      this.loadingUserSuccesfull == true &&
      this.loadingBrandSuccesfull == true &&
      this.loadingSkillsSuccesfull == true &&
      this.loadingStoresSuccesfull == true;

  @override
  List<Object> get props => [
        status,
        loadingUserSuccesfull,
        loadingBrandSuccesfull,
        loadingStoresSuccesfull,
        loadingSkillsSuccesfull,
      ];
}
