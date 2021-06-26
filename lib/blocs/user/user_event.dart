/*
 * Author: Trung Shin
 */
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserEventChange extends UserEvent {
  final UserModel userModel;

  const UserEventChange({@required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class UserEventGet extends UserEvent {}

class UserEventUpdate extends UserEvent {
  final UserModel userModel;
  const UserEventUpdate({
    @required this.userModel,
  });

  @override
  List<Object> get props => [userModel];
}
