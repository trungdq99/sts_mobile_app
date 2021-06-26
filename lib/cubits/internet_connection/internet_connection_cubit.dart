/*
 * Author: Trung Shin
 */
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../../constant.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  InternetConnectionCubit() : super(InternetConnectionState()) {
    initConnectivity();
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return updateConnectionStatus(result);
  }

  void updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        emit(state.copyWith(status: InternetConnectionStatus.connected));
        break;
      case ConnectivityResult.none:
        emit(state.copyWith(status: InternetConnectionStatus.notConnected));
        break;
      default:
        emit(state.copyWith(status: InternetConnectionStatus.initial));
        break;
    }
  }
}
