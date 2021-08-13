part of 'shift_attendance_bloc.dart';

enum ShiftAttendanceStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class ShiftAttendanceState extends Equatable {
  final ShiftAttendanceStatus status;
  final List<ShiftAttendanceModel> listShiftAttendance;
  final DateTimeRange selectedWeek;
  final String message;
  const ShiftAttendanceState({
    this.status: ShiftAttendanceStatus.initial,
    this.listShiftAttendance: const [],
    this.selectedWeek,
    this.message: '',
  });

  ShiftAttendanceState copyWith({
    ShiftAttendanceStatus status,
    List<ShiftAttendanceModel> listShiftAttendance,
    DateTimeRange selectedWeek,
    String message,
  }) =>
      ShiftAttendanceState(
        status: status ?? this.status,
        listShiftAttendance: listShiftAttendance ?? this.listShiftAttendance,
        selectedWeek: selectedWeek ?? this.selectedWeek,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        listShiftAttendance,
        selectedWeek,
        message,
      ];
}
