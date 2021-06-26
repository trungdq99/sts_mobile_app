/*
 * Author: Trung Shin
 */
part of 'internet_connection_cubit.dart';

enum InternetConnectionStatus {
  initial,
  connected,
  notConnected,
}

class InternetConnectionState extends Equatable {
  final InternetConnectionStatus status;
  final InternetConnectionStatus prevStatus;
  const InternetConnectionState({
    this.status: InternetConnectionStatus.initial,
    this.prevStatus: InternetConnectionStatus.initial,
  });

  InternetConnectionState copyWith({
    InternetConnectionStatus status,
  }) =>
      InternetConnectionState(
        prevStatus: this.status,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [
        status,
        prevStatus,
      ];
}
