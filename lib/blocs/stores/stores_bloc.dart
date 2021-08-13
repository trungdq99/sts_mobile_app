import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';

part 'stores_event.dart';
part 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  final StoresRepository _storeRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<List<StoreModel>> _listStoresSubcription;
  StoresBloc({
    @required StoresRepository storeRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _storeRepository = storeRepository,
        _authenticationRepository = authenticationRepository,
        super(StoresState()) {
    _listStoresSubcription = _storeRepository.listStores
        .listen((event) => add(StoresEventChanged(listStores: event)));
  }

  @override
  Future<void> close() {
    _listStoresSubcription?.cancel();
    _authenticationRepository?.dispose();
    _storeRepository?.dispose();
    return super.close();
  }

  @override
  Stream<StoresState> mapEventToState(
    StoresEvent event,
  ) async* {
    if (event is StoresEventChanged) {
      yield* _mapChangedToState(event);
    } else if (event is StoresEventGet) {
      yield* _mapGetToState(event);
    }
  }

  Stream<StoresState> _mapChangedToState(
    StoresEventChanged event,
  ) async* {
    if (event.listStores != null) {
      yield state.copyWith(
        status: StoresStatus.loading,
      );
      yield state.copyWith(
        listStores: event.listStores,
        status: StoresStatus.loadingSuccessful,
      );
    } else {
      yield state.copyWith(
        status: StoresStatus.loadingFailure,
        message: StringUtil.DEFAULT_ERROR,
      );
    }
  }

  // Map Load Brand to state
  Stream<StoresState> _mapGetToState(StoresEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: StoresStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      await _storeRepository.getStores();
      yield state.copyWith(
        message: 'Load successful!',
      );
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('StoresBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: StoresStatus.loadingFailure,
        message: error,
      );
    }
  }
}
