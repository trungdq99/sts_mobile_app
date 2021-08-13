part of 'stores_bloc.dart';

enum StoresStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class StoresState extends Equatable {
  final StoresStatus status;
  final List<StoreModel> listStores;
  final String message;
  const StoresState({
    this.status: StoresStatus.initial,
    this.listStores: const [],
    this.message: '',
  });

  StoresState copyWith({
    StoresStatus status,
    List<StoreModel> listStores,
    String message,
  }) =>
      StoresState(
        status: status ?? this.status,
        listStores: listStores ?? this.listStores,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        listStores,
        message,
      ];
}
