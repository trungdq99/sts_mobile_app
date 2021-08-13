part of 'week_schedule_bloc.dart';

enum WeekScheduleStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class WeekScheduleState extends Equatable {
  final WeekScheduleStatus status;
  final WeekScheduleModel weekScheduleModel;
  final String message;

  const WeekScheduleState({
    this.status: WeekScheduleStatus.initial,
    this.weekScheduleModel: WeekScheduleModel.empty,
    this.message: '',
  });

  WeekScheduleState copyWith({
    WeekScheduleStatus status,
    WeekScheduleModel weekScheduleModel,
    String message,
  }) =>
      WeekScheduleState(
        status: status ?? this.status,
        weekScheduleModel: weekScheduleModel ?? this.weekScheduleModel,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        weekScheduleModel,
        message,
      ];
}
