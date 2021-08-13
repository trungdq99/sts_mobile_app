import 'package:equatable/equatable.dart';

class WeekScheduleModel extends Equatable {
  final int id;

  const WeekScheduleModel({
    this.id: 0,
  });

  static const WeekScheduleModel empty = WeekScheduleModel(id: 0);

  factory WeekScheduleModel.fromJson(Map<String, dynamic> json) =>
      WeekScheduleModel(
        id: json['id'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };

  WeekScheduleModel copyWith({
    int id,
  }) {
    return WeekScheduleModel(
      id: id ?? this.id,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
    ];
  }
}
