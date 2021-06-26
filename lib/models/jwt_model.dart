/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class JwtModel extends Equatable {
  final String nameid;
  final String role;
  final String brandId;
  final int nbf;
  final int exp;
  final int iat;

  const JwtModel({
    this.nameid: '',
    this.role: '',
    this.brandId: '',
    this.nbf: 0,
    this.exp: 0,
    this.iat: 0,
  });

  factory JwtModel.fromJson(Map<String, dynamic> json) => JwtModel(
        nameid: json['nameid'] as String,
        role: json['role'] as String,
        brandId: json['brandId'] as String,
        nbf: json['nbf'] as int,
        exp: json['exp'] as int,
        iat: json['iat'] as int,
      );

  factory JwtModel.fromToken(String token) {
    if (token != null && token.isNotEmpty) {
      Map<String, dynamic> json = JwtDecoder.decode(token);
      return JwtModel.fromJson(json);
    } else {
      return JwtModel();
    }
  }

  Map<String, dynamic> toJson() => {
        'nameid': nameid,
        'role': role,
        'brandId': brandId,
        'nbf': nbf,
        'exp': exp,
        'iat': iat,
      };

  JwtModel copyWith({
    String nameid,
    String role,
    String brandId,
    int nbf,
    int exp,
    int iat,
  }) {
    return JwtModel(
      nameid: nameid ?? this.nameid,
      role: role ?? this.role,
      brandId: brandId ?? this.brandId,
      nbf: nbf ?? this.nbf,
      exp: exp ?? this.exp,
      iat: iat ?? this.iat,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [nameid, role, brandId, nbf, exp, iat];
}
