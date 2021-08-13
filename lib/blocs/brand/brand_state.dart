part of 'brand_bloc.dart';

enum BrandStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class BrandState extends Equatable {
  final BrandStatus status;
  final BrandModel brandModel;
  final String message;
  const BrandState({
    this.status: BrandStatus.initial,
    this.brandModel: BrandModel.empty,
    this.message: '',
  });

  BrandState copyWith({
    BrandStatus status,
    BrandModel brandModel,
    String message,
  }) =>
      BrandState(
        status: status ?? this.status,
        brandModel: brandModel ?? this.brandModel,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        brandModel,
        message,
      ];
}
