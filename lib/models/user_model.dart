import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String dob;
  final String phone;
  final bool gender;
  final String address;
  final dynamic photoUrl;

  const UserModel({
    this.username: '',
    this.email: '',
    this.firstName: '',
    this.lastName: '',
    this.dob: '',
    this.phone: '',
    this.gender,
    this.address: '',
    this.photoUrl: '',
  });

  static const empty = UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dob: json['dob'] as String,
      phone: json['phone'] as String,
      gender: json['gender'],
      address: json['address'] as String,
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'phone': phone,
      'gender': gender,
      'address': address,
      'photoUrl': photoUrl,
    };
  }

  UserModel copyWith({
    String username,
    String email,
    String password,
    String passwordSalt,
    String firstName,
    String lastName,
    String dob,
    String phone,
    bool gender,
    String address,
    dynamic photoUrl,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      photoUrl: photoUrl ?? this.photoUrl,
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
      dob,
      phone,
      gender,
      address,
      photoUrl,
    ];
  }
}
