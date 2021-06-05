import 'package:equatable/equatable.dart';

class AuthenticationModel extends Equatable {
  final int status;
  final String username;
  final String token;
  final String message;

  const AuthenticationModel(
      {this.status, this.username, this.token, this.message});

  static const empty = AuthenticationModel(
    status: 0,
    token: '',
    username: '',
    message: '',
  );

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      status: json['status'] as int,
      username: json['username'] as String,
      token: json['token'] as String,
      message: json['message'] ?? '',
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
  }) {
    return AuthenticationModel(
      status: status ?? this.status,
      username: username ?? this.username,
      token: token ?? this.token,
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
      ];
}
