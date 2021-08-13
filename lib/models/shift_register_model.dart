import 'package:equatable/equatable.dart';

class ShiftRegisterModel extends Equatable {
  final int id;
  final String username;
  final int weekScheduleId;
  final String timeStart;
  final String timeEnd;

  const ShiftRegisterModel({
    this.id,
    this.username,
    this.weekScheduleId,
    this.timeStart,
    this.timeEnd,
  });

  factory ShiftRegisterModel.fromJson(Map<String, dynamic> json) =>
      ShiftRegisterModel(
        id: json['id'] ?? 0,
        username: json['username'] ?? '',
        weekScheduleId: json['weekScheduleId'] ?? 0,
        timeStart: json['timeStart'] ?? '',
        timeEnd: json['timeEnd'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'timeStart': timeStart,
        'timeEnd': timeEnd,
      };

  ShiftRegisterModel copyWith({
    int id,
    String username,
    int weekScheduleId,
    String timeStart,
    String timeEnd,
  }) {
    return ShiftRegisterModel(
      id: id ?? this.id,
      username: username ?? this.username,
      weekScheduleId: weekScheduleId ?? this.weekScheduleId,
      timeStart: timeStart ?? this.timeStart,
      timeEnd: timeEnd ?? this.timeEnd,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      username,
      weekScheduleId,
      timeStart,
      timeEnd,
    ];
  }
}
