/*
 * Author: Trung Shin
 */

part of 'user_bloc.dart';

enum UserStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class UserState extends Equatable {
  final UserStatus status;
  final UserModel userModel;
  final String message;

  const UserState({
    this.status: UserStatus.initial,
    this.userModel: UserModel.empty,
    this.message: '',
  });

  UserState copyWith({
    UserStatus status,
    UserModel userModel,
    String message,
  }) =>
      UserState(
        status: status ?? this.status,
        userModel: userModel ?? this.userModel,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        userModel,
        message,
      ];
}
