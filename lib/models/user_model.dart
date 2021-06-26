/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';
import 'package:sts/utils/date_time_util.dart';
import 'package:sts/utils/gender_util.dart';

class UserModel extends Equatable {
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String dob;
  final String phone;
  final String gender;
  final String address;
  final String photoUrl;

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
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      dob: DateTimeUtil.formatDateTimeStringToDateString(json['dob'] ?? ''),
      phone: json['phone'] ?? '',
      gender: GenderUtil.checkGender(json['gender']),
      address: json['address'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'dob': DateTimeUtil.formatDateStringToDateTimeString(dob),
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
    String gender,
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
