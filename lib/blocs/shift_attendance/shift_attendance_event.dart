part of 'shift_attendance_bloc.dart';

abstract class ShiftAttendanceEvent extends Equatable {
  const ShiftAttendanceEvent();

  @override
  List<Object> get props => [];
}

class ShiftAttendanceEventGet extends ShiftAttendanceEvent {
  final DateTimeRange selectedWeek;
  const ShiftAttendanceEventGet({this.selectedWeek});
  @override
  List<Object> get props => [
        selectedWeek,
      ];
}

class ShiftAttendanceEventCurWeekChanged extends ShiftAttendanceEvent {
  final List<ShiftAttendanceModel> listShiftAttendance;
  const ShiftAttendanceEventCurWeekChanged(
      {@required this.listShiftAttendance});

  @override
  List<Object> get props => [listShiftAttendance];
}
