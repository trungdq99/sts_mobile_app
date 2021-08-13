part of 'stores_bloc.dart';

abstract class StoresEvent extends Equatable {
  const StoresEvent();

  @override
  List<Object> get props => [];
}

class StoresEventChanged extends StoresEvent {
  final List<StoreModel> listStores;
  const StoresEventChanged({
    @required this.listStores,
  });
  @override
  List<Object> get props => [listStores];
}

class StoresEventGet extends StoresEvent {}
