part of 'notification_bloc.dart';

enum NotificationStatus {
  initial,
  loading,
  loadingSuccess,
}

class NotificationState extends Equatable {
  final NotificationStatus status;
  const NotificationState({
    this.status: NotificationStatus.initial,
  });

  @override
  List<Object> get props => [
        status,
      ];
}
