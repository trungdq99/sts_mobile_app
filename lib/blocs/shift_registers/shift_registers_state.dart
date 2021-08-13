part of 'shift_registers_bloc.dart';

enum ShiftRegistersStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class ShiftRegistersState extends Equatable {
  final ShiftRegistersStatus status;
  final List<ShiftRegisterModel> listShiftRegisters;
  final DateTimeRange selectedWeek;
  final String message;
  const ShiftRegistersState({
    this.status: ShiftRegistersStatus.initial,
    this.listShiftRegisters: const [],
    this.selectedWeek,
    this.message: '',
  });

  ShiftRegistersState copyWith({
    ShiftRegistersStatus status,
    List<ShiftRegisterModel> listShiftRegisters,
    DateTimeRange selectedWeek,
    String message,
  }) =>
      ShiftRegistersState(
        status: status ?? this.status,
        listShiftRegisters: listShiftRegisters ?? this.listShiftRegisters,
        selectedWeek: selectedWeek ?? this.selectedWeek,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        listShiftRegisters,
        selectedWeek,
        message,
      ];
}
