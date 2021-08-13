part of 'shift_registers_bloc.dart';

abstract class ShiftRegistersEvent extends Equatable {
  const ShiftRegistersEvent();

  @override
  List<Object> get props => [];
}

class ShiftRegistersEventGet extends ShiftRegistersEvent {
  final DateTimeRange selectedWeek;
  const ShiftRegistersEventGet({this.selectedWeek});
  @override
  List<Object> get props => [
        selectedWeek,
      ];
}

class ShiftRegistersEventAdd extends ShiftRegistersEvent {
  final String userName;
  final DateTimeRange timeWorks;
  final int weekScheduleId;
  const ShiftRegistersEventAdd({
    @required this.timeWorks,
    @required this.userName,
    @required this.weekScheduleId,
  });

  @override
  List<Object> get props => [
        timeWorks,
        userName,
        weekScheduleId,
      ];
}

class ShiftRegistersEventUpdate extends ShiftRegistersEvent {
  final DateTimeRange timeWorks;
  final int id;
  const ShiftRegistersEventUpdate({
    @required this.timeWorks,
    @required this.id,
  });

  @override
  List<Object> get props => [
        timeWorks,
        id,
      ];
}

class ShiftRegistersEventDelete extends ShiftRegistersEvent {
  final int id;

  const ShiftRegistersEventDelete({@required this.id});
  @override
  List<Object> get props => [
        id,
      ];
}
