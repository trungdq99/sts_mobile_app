import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String avatar;

  const UserModel({
    this.id: 0,
    this.name: '',
    this.email: '',
    this.phone: '',
    this.avatar: '',
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        email,
        phone,
        avatar,
      ];
}