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

class ShiftAttendanceEventChanged extends ShiftAttendanceEvent {
  final List<ShiftAttendanceModel> listShiftAttendance;
  final DateTimeRange selectedWeek;
  const ShiftAttendanceEventChanged({
    @required this.listShiftAttendance,
    @required this.selectedWeek,
  });
  @override
  List<Object> get props => [
        listShiftAttendance,
        selectedWeek,
      ];
}
