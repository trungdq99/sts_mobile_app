/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';

class ShiftAssignmentModel extends Equatable {
  final int id;
  final int storeId;
  final int skillId;
  final String timeStart;
  final String timeEnd;
  final String timeCheckIn;
  final String timeCheckOut;
  final int referenceId;

  const ShiftAssignmentModel({
    this.id: 0,
    this.storeId: 0,
    this.skillId: 0,
    this.timeStart: '',
    this.timeEnd: '',
    this.timeCheckIn: '',
    this.timeCheckOut: '',
    this.referenceId: 0,
  });

  static const ShiftAssignmentModel empty = ShiftAssignmentModel(
    id: 0,
    storeId: 0,
    skillId: 0,
    timeStart: '',
    timeEnd: '',
    timeCheckIn: '',
    timeCheckOut: '',
    referenceId: 0,
  );

  factory ShiftAssignmentModel.fromJson(Map<String, dynamic> json) =>
      ShiftAssignmentModel(
        id: json['id'] ?? 0,
        storeId: json['storeId'] ?? 0,
        skillId: json['skillId'] ?? 0,
        timeStart: json['timeStart'] ?? '',
        timeEnd: json['timeEnd'] ?? '',
        timeCheckIn: json['timeCheckIn'] ?? '',
        timeCheckOut: json['timeCheckOut'] ?? '',
        referenceId: json['referenceId'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'storeId': storeId,
        'skillId': skillId,
        'timeStart': timeStart,
        'timeEnd': timeEnd,
        'timeCheckIn': timeCheckIn,
        'timeCheckOut': timeCheckOut,
        'referenceId': referenceId,
      };

  ShiftAssignmentModel copyWith({
    int id,
    int storeId,
    int skillId,
    String timeStart,
    String timeEnd,
    String timeCheckIn,
    String timeCheckOut,
    int referenceId,
  }) {
    return ShiftAssignmentModel(
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      skillId: skillId ?? this.skillId,
      timeStart: timeStart ?? this.timeStart,
      timeEnd: timeEnd ?? this.timeEnd,
      timeCheckIn: timeCheckIn ?? this.timeCheckIn,
      timeCheckOut: timeCheckOut ?? this.timeCheckOut,
      referenceId: referenceId ?? this.referenceId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      storeId,
      skillId,
      timeStart,
      timeEnd,
      timeCheckIn,
      timeCheckOut,
      referenceId,
    ];
  }
}
