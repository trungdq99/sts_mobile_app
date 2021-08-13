part of 'shift_assignment_bloc.dart';

enum ShiftAssignmentStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class ShiftAssignmentState extends Equatable {
  final ShiftAssignmentStatus status;
  final List<ShiftAssignmentModel> listShiftAssignments;
  final List<ShiftAssignmentModel> listCurWeekShiftAssignments;
  final DateTimeRange selectedWeek;
  final String message;

  const ShiftAssignmentState({
    this.status: ShiftAssignmentStatus.initial,
    this.listShiftAssignments: const [],
    this.listCurWeekShiftAssignments: const [],
    this.selectedWeek,
    this.message: '',
  });

  ShiftAssignmentState copyWith({
    ShiftAssignmentStatus status,
    List<ShiftAssignmentModel> listShiftAssignments,
    List<ShiftAssignmentModel> listCurWeekShiftAssignments,
    DateTimeRange selectedWeek,
    String message,
  }) =>
      ShiftAssignmentState(
        status: status ?? this.status,
        listShiftAssignments: listShiftAssignments ?? this.listShiftAssignments,
        listCurWeekShiftAssignments:
            listCurWeekShiftAssignments ?? this.listCurWeekShiftAssignments,
        selectedWeek: selectedWeek ?? this.selectedWeek,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        listShiftAssignments,
        listCurWeekShiftAssignments,
        selectedWeek,
        message,
      ];
}
