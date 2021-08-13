/*
 * Author: Trung Shin
 */
import 'package:equatable/equatable.dart';

class ShiftAttendanceModel extends Equatable {
  final int storeId;
  final String timeCheck;
  final String imageUrl;

  const ShiftAttendanceModel({
    this.storeId: 0,
    this.timeCheck: '',
    this.imageUrl: '',
  });

  factory ShiftAttendanceModel.fromJson(Map<String, dynamic> json) =>
      ShiftAttendanceModel(
        storeId: json['storeId'] ?? 0,
        timeCheck: json['timeCheck'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
      );

  // Map<String, dynamic> toJson() => {

  //     };

  ShiftAttendanceModel copyWith({
    int storeId,
    String timeCheck,
    String imageUrl,
  }) {
    return ShiftAttendanceModel(
      storeId: storeId ?? this.storeId,
      timeCheck: timeCheck ?? this.timeCheck,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      storeId,
      timeCheck,
      imageUrl,
    ];
  }
}
