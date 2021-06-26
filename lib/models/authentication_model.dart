/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sts/models/jwt_model.dart';

class AuthenticationModel extends Equatable {
  final int status;
  final String username;
  final String token;
  final JwtModel tokenDecode;
  final String message;

  const AuthenticationModel({
    this.status,
    this.username,
    this.token,
    this.message,
    this.tokenDecode,
  });

  static const empty = AuthenticationModel(
    status: 0,
    token: '',
    username: '',
    message: '',
    tokenDecode: JwtModel(),
  );

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    String token = json['token'] ?? '';
    return AuthenticationModel(
      status: json['status'] ?? 0,
      username: json['username'] ?? '',
      token: token,
      message: json['message'] ?? '',
      tokenDecode: JwtModel.fromToken(token),
    );
  }

  factory AuthenticationModel.fromToken(String token) {
    JwtModel tokenDecode = JwtModel.fromJson(JwtDecoder.decode(token));
    return AuthenticationModel(
      status: 200,
      username: tokenDecode.nameid,
      token: token,
      message: '',
      tokenDecode: tokenDecode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'username': username,
      'token': token,
    };
  }

  AuthenticationModel copyWith({
    int status,
    String username,
    String token,
    String message,
  }) {
    String tok = token ?? this.token;
    return AuthenticationModel(
      status: status ?? this.status,
      username: username ?? this.username,
      token: tok,
      message: message ?? this.message,
      tokenDecode: JwtModel.fromJson(JwtDecoder.decode(tok)),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        status,
        username,
        token,
        message,
        tokenDecode,
      ];
}
