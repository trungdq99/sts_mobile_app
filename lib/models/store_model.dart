/*
 * Author: Trung Shin
 */
import 'package:equatable/equatable.dart';
import 'package:sts/models/models.dart';

class StoreModel extends Equatable {
  final int id;
  final int brandId;
  final BrandModel brandModel;
  final String name;
  final String address;
  final String phone;

  const StoreModel({
    this.id: 0,
    this.brandId: 0,
    this.brandModel: BrandModel.empty,
    this.name: '',
    this.address: '',
    this.phone: '',
  });

  static const StoreModel empty = StoreModel(
    id: 0,
    brandId: 0,
    brandModel: BrandModel.empty,
    name: '',
    address: '',
    phone: '',
  );

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'] ?? 0,
        brandId: json['brandId'] ?? 0,
        name: json['name'] ?? '',
        address: json['address'] ?? '',
        phone: json['phone'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'brandId': brandId,
        'name': name,
        'address': address,
        'phone': phone,
      };

  StoreModel copyWith({
    int id,
    int brandId,
    BrandModel brandModel,
    String name,
    String address,
    String phone,
  }) {
    return StoreModel(
      id: id ?? this.id,
      brandId: brandId ?? this.brandId,
      brandModel: brandModel ?? this.brandModel,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      brandId,
      brandModel,
      name,
      address,
      phone,
    ];
  }
}
