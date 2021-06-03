import 'package:equatable/equatable.dart';
import 'package:sts/models/user_model.dart';

class AuthenticationModel extends Equatable {
  final String status;
  final String token;
  final UserModel user;
  const AuthenticationModel({
    this.status: '',
    this.token: '',
    this.user: const UserModel(),
  });

  static AuthenticationModel fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> user = json['user'];
    return AuthenticationModel(
      status: json['status'] ?? '',
      token: json['token'] ?? '',
      user: UserModel.fromJson(user) ?? UserModel(),
    );
  }

  static AuthenticationModel fromJsonWithToken(
      Map<String, dynamic> json, String token) {
    Map<String, dynamic> user = json['user'];
    return AuthenticationModel(
      status: json['status'] ?? '',
      token: token ?? '',
      user: UserModel.fromJson(user) ?? UserModel(),
    );
  }

  @override
  List<Object> get props => [
        status,
        token,
        user,
      ];
}