/*
 * Author: Trung Shin
 */

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:sts/models/models.dart';
import 'package:sts/repository/repository.dart';
import 'package:sts/utils/utils.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository _brandRepository;
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<BrandModel> _brandSubcription;
  BrandBloc({
    @required BrandRepository brandRepository,
    @required AuthenticationRepository authenticationRepository,
  })  : _brandRepository = brandRepository,
        _authenticationRepository = authenticationRepository,
        super(BrandState()) {
    _brandSubcription =
        _brandRepository.brand.listen((event) => add(BrandEventChanged(
              brandModel: event,
            )));
  }

  @override
  Future<void> close() {
    _brandSubcription?.cancel();
    _authenticationRepository?.dispose();
    _brandRepository?.dispose();
    return super.close();
  }

  @override
  Stream<BrandState> mapEventToState(
    BrandEvent event,
  ) async* {
    if (event is BrandEventChanged) {
      yield* _mapChangedToState(event);
    } else if (event is BrandEventGet) {
      yield* _mapGetToState(event);
    }
  }

  Stream<BrandState> _mapChangedToState(
    BrandEventChanged event,
  ) async* {
    if (event.brandModel != BrandModel.empty) {
      yield state.copyWith(
        status: BrandStatus.loading,
      );
      yield state.copyWith(
        brandModel: event.brandModel,
        status: BrandStatus.loadingSuccessful,
      );
    } else {
      yield state.copyWith(
        status: BrandStatus.loadingFailure,
        message: StringUtil.DEFAULT_ERROR,
      );
    }
  }

  // Map Load Brand to state
  Stream<BrandState> _mapGetToState(BrandEventGet event) async* {
    // Change to loading status
    yield state.copyWith(status: BrandStatus.loading);
    await Future.delayed(Duration(milliseconds: 1000));
    try {
      await _brandRepository.getBrand(
        id: event.id,
      );
      yield state.copyWith(
        message: 'Load successful!',
      );
    } catch (e) {
      String error = FunctionUtil.getException(e);
      print('BrandBloc - _mapGetToState: $error');
      if (error == ResponseStatusUtil.UNAUTHENTICATED) {
        FunctionUtil.handleUnauthentication(_authenticationRepository);
      }
      yield state.copyWith(
        status: BrandStatus.loadingFailure,
        message: error,
      );
    }
  }
}
