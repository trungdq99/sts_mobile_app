/*
 * Author: Trung Shin
 */

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';

part 'shift_registers_event.dart';
part 'shift_registers_state.dart';

class ShiftRegistersBloc
    extends Bloc<ShiftRegistersEvent, ShiftRegistersState> {
  final ShiftRegistersRepository _shiftRegistersRepository;
  final AuthenticationRepository _authenticationRepository;
  ShiftRegistersBloc({
    @required ShiftRegistersRepository shiftRegistersRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _shiftRegistersRepository = shiftRegistersRepository,
        _authenticationRepository = authenticationRepository,
        super(ShiftRegistersState());

  @override
  Stream<ShiftRegistersState> mapEventToState(
    ShiftRegistersEvent event,
  ) async* {
    if (event is ShiftRegistersEventGet) {
      yield* _mapGetToState(event);
    } else if (event is ShiftRegistersEventAdd) {
      yield* _mapAddToState(event);
    } else if (event is ShiftRegistersEventUpdate) {
      yield* _mapUpdateToState(event);
    } else if (event is ShiftRegistersEventDelete) {
      yield* _mapDeleteToState(event);
    }
  }

  // Map Load shift registers to state
  Stream<ShiftRegistersState> _mapGetToState(
      ShiftRegistersEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: ShiftRegistersStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));

    try {
      List<ShiftRegisterModel> listRegisterModel;
      listRegisterModel = await _shiftRegistersRepository.getShiftRegisters(
        selectedWeek: event.selectedWeek,
      );
      if (listRegisterModel != null) {
        yield state.copyWith(
          status: ShiftRegistersStatus.loadingSuccessful,
          message: 'Load successful!',
          listShiftRegisters: listRegisterModel,
          selectedWeek: event.selectedWeek,
        );
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('ShiftRegistersBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: ShiftRegistersStatus.loadingFailure,
        message: error,
      );
    }
  }

  // Map Load shift registers to state
  Stream<ShiftRegistersState> _mapAddToState(
      ShiftRegistersEventAdd event) async* {
    // Change to loading status
    yield state.copyWith(status: ShiftRegistersStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));

    try {
      bool result = false;
      result = await _shiftRegistersRepository.addShiftRegister(
        username: event.userName,
        timeWorks: event.timeWorks,
        weekScheduleId: event.weekScheduleId,
      );
      if (result == true) {
        yield state.copyWith(
          status: ShiftRegistersStatus.loadingSuccessful,
          message: 'Add successful!',
        );
        yield* _mapGetToState(ShiftRegistersEventGet(
          selectedWeek: state.selectedWeek,
        ));
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('ShiftRegistersBloc - _mapAddToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: ShiftRegistersStatus.loadingFailure,
        message: error,
      );
    }
  }

  // Map Load shift registers to state
  Stream<ShiftRegistersState> _mapUpdateToState(
      ShiftRegistersEventUpdate event) async* {
    // Change to loading status
    yield state.copyWith(status: ShiftRegistersStatus.loading);

    try {
      bool result = false;
      result = await _shiftRegistersRepository.updateShiftRegister(
        timeWorks: event.timeWorks,
        id: event.id,
      );
      if (result == true) {
        yield state.copyWith(
          status: ShiftRegistersStatus.loadingSuccessful,
          message: 'Update successful!',
        );
        yield* _mapGetToState(ShiftRegistersEventGet(
          selectedWeek: state.selectedWeek,
        ));
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('ShiftRegistersBloc - _mapUpdateToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: ShiftRegistersStatus.loadingFailure,
        message: error,
      );
    }
  }

  // Map Load shift registers to state
  Stream<ShiftRegistersState> _mapDeleteToState(
      ShiftRegistersEventDelete event) async* {
    // Change to loading status
    yield state.copyWith(status: ShiftRegistersStatus.loading);

    try {
      bool result = false;
      result = await _shiftRegistersRepository.deleteShiftRegister(
        id: event.id,
      );
      if (result == true) {
        yield state.copyWith(
          status: ShiftRegistersStatus.loadingSuccessful,
          message: 'Delete successful!',
        );
        yield* _mapGetToState(ShiftRegistersEventGet(
          selectedWeek: state.selectedWeek,
        ));
      }
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('ShiftRegistersBloc - _mapDeleteToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: ShiftRegistersStatus.loadingFailure,
        message: error,
      );
    }
  }

  bool isValidShiftAdd({
    @required DateTimeRange dateTimeRange,
  }) {
    int index = state.listShiftRegisters.indexWhere((element) {
      DateTimeRange data = DateTimeRange(
        start: DateTimeUtil.convertStringToDateTime(
          dateStr: element.timeStart,
          format: DateTimeUtil.YMDhms,
        ),
        end: DateTimeUtil.convertStringToDateTime(
          dateStr: element.timeEnd,
          format: DateTimeUtil.YMDhms,
        ),
      );
      return !DateTimeUtil.isValidDateTimeRange(data, dateTimeRange);
    });
    return index < 0;
  }

  bool isValidShiftUpdate({
    @required DateTimeRange dateTimeRange,
    @required int id,
  }) {
    int index = state.listShiftRegisters.indexWhere((element) {
      if (element.id == id) {
        return false;
      } else {
        DateTimeRange data = DateTimeRange(
          start: DateTimeUtil.convertStringToDateTime(
            dateStr: element.timeStart,
            format: DateTimeUtil.YMDhms,
          ),
          end: DateTimeUtil.convertStringToDateTime(
            dateStr: element.timeEnd,
            format: DateTimeUtil.YMDhms,
          ),
        );

        return !DateTimeUtil.isValidDateTimeRange(data, dateTimeRange);
      }
    });
    return index < 0;
  }
}
