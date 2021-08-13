/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';

class BrandModel extends Equatable {
  final int id;
  final String name;
  final String logoImg;
  final String address;
  final String hotline;

  const BrandModel({
    this.id: 0,
    this.name: '',
    this.logoImg: '',
    this.address: '',
    this.hotline: '',
  });

  static const BrandModel empty = BrandModel(
    id: 0,
    name: '',
    logoImg: '',
    address: '',
    hotline: '',
  );

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        logoImg: json['logoImg'] ?? '',
        address: json['address'] ?? '',
        hotline: json['hotline'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logoImg': logoImg,
        'address': address,
        'hotline': hotline,
      };

  BrandModel copyWith({
    int id,
    String name,
    String logoImg,
    String address,
    String hotline,
  }) {
    return BrandModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logoImg: logoImg ?? this.logoImg,
      address: address ?? this.address,
      hotline: hotline ?? this.hotline,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      logoImg,
      address,
      hotline,
    ];
  }
}
