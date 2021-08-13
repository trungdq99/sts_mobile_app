part of 'brand_bloc.dart';

abstract class BrandEvent extends Equatable {
  const BrandEvent();

  @override
  List<Object> get props => [];
}

class BrandEventChanged extends BrandEvent {
  final BrandModel brandModel;
  const BrandEventChanged({
    @required this.brandModel,
  });
  @override
  List<Object> get props => [brandModel];
}

class BrandEventGet extends BrandEvent {
  final int id;
  const BrandEventGet({
    @required this.id,
  });
  @override
  List<Object> get props => [
        id,
      ];
}
