part of 'week_schedule_bloc.dart';

abstract class WeekScheduleEvent extends Equatable {
  const WeekScheduleEvent();

  @override
  List<Object> get props => [];
}

class WeekScheduleEventGet extends WeekScheduleEvent {
  final DateTimeRange selectedWeek;
  const WeekScheduleEventGet({@required this.selectedWeek});
  @override
  List<Object> get props => [
        selectedWeek,
      ];
}
