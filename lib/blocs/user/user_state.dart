part of 'user_bloc.dart';

enum LoadUserStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class UserState extends Equatable {
  final LoadUserStatus loadStatus;
  final UserModel userModel;
  const UserState({
    this.loadStatus: LoadUserStatus.initial,
    this.userModel: UserModel.empty,
  });

  UserState copyWith({
    LoadUserStatus loadStatus,
    UserModel userModel,
  }) =>
      UserState(
        loadStatus: loadStatus ?? this.loadStatus,
        userModel: userModel ?? this.userModel,
      );

  @override
  List<Object> get props => [
        loadStatus,
        userModel,
      ];
}
