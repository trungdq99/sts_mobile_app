import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String phone;
  final bool gender;
  final String address;
  final dynamic photoUrl;
  final int roleId;
  final dynamic role;

  const UserModel({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phone,
    this.gender,
    this.address,
    this.photoUrl,
    this.roleId,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      phone: json['phone'] as String,
      gender: json['gender'],
      address: json['address'] as String,
      photoUrl: json['photoUrl'],
      roleId: json['roleId'] as int,
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'phone': phone,
      'gender': gender,
      'address': address,
      'photoUrl': photoUrl,
      'roleId': roleId,
      'role': role,
    };
  }

  UserModel copyWith({
    String username,
    String email,
    String password,
    String passwordSalt,
    String firstName,
    String lastName,
    String dateOfBirth,
    String phone,
    bool gender,
    String address,
    dynamic photoUrl,
    int roleId,
    dynamic role,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      photoUrl: photoUrl ?? this.photoUrl,
      roleId: roleId ?? this.roleId,
      role: role ?? this.role,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      username,
      email,
      firstName,
      lastName,
      dateOfBirth,
      phone,
      gender,
      address,
      photoUrl,
      roleId,
      role,
    ];
  }
}
