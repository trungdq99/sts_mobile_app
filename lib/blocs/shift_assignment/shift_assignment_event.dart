part of 'shift_assignment_bloc.dart';

abstract class ShiftAssignmentEvent extends Equatable {
  const ShiftAssignmentEvent();

  @override
  List<Object> get props => [];
}

class ShiftAssignmentEventCurWeekChanged extends ShiftAssignmentEvent {
  final List<ShiftAssignmentModel> listShiftAssignment;
  const ShiftAssignmentEventCurWeekChanged(
      {@required this.listShiftAssignment});

  @override
  List<Object> get props => [listShiftAssignment];
}

class ShiftAssignmentEventGet extends ShiftAssignmentEvent {
  final DateTimeRange selectedWeek;
  const ShiftAssignmentEventGet({
    @required this.selectedWeek,
  });
  @override
  List<Object> get props => [
        selectedWeek,
      ];
}
