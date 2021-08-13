/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';
import 'package:sts/utils/utils.dart';

class UserModel extends Equatable {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String dob;
  final String phone;
  final int gender;
  final String address;
  final String photoUrl;
  final int brandId;

  const UserModel({
    this.username: '',
    this.email: '',
    this.firstName: '',
    this.lastName: '',
    this.dob: '',
    this.phone: '',
    this.gender: GenderUtil.UNKNOWN,
    this.address: '',
    this.photoUrl: '',
    this.brandId: 0,
  });

  static const UserModel empty = UserModel(
    username: '',
    email: '',
    firstName: '',
    lastName: '',
    dob: '',
    phone: '',
    gender: GenderUtil.UNKNOWN,
    address: '',
    photoUrl: '',
    brandId: 0,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      dob: json['dob'],
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? GenderUtil.UNKNOWN,
      address: json['address'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      brandId: json['brandId'] ?? 0,
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
      'brandId': brandId,
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
    int gender,
    String address,
    String photoUrl,
    int brandId,
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
      brandId: brandId ?? this.brandId,
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
      brandId,
    ];
  }
}
