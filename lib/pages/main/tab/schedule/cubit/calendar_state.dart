part of 'calendar_cubit.dart';

class CalendarState extends Equatable {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final CalendarFormat format;

  const CalendarState({
    this.selectedDay,
    this.focusedDay,
    this.format,
  });

  factory CalendarState.initial() => CalendarState(
        focusedDay: DateTime.now(),
        selectedDay: DateTime.now(),
        format: CalendarFormat.week,
      );

  CalendarState copyWith({
    DateTime selectedDay,
    DateTime focusedDay,
    CalendarFormat format,
  }) =>
      CalendarState(
        selectedDay: selectedDay ?? this.selectedDay,
        focusedDay: focusedDay ?? this.focusedDay,
        format: format ?? this.format,
      );

  @override
  List<Object> get props => [
        selectedDay,
        focusedDay,
        format,
      ];
}
