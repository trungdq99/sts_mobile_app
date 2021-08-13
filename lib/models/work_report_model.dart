import 'package:equatable/equatable.dart';

class WorkReportModel extends Equatable {
  final double hoursAssigned;
  final double hoursWorked;

  const WorkReportModel({
    this.hoursAssigned: 0,
    this.hoursWorked: 0,
  });

  static const WorkReportModel empty = WorkReportModel(
    hoursAssigned: 0,
    hoursWorked: 0,
  );

  factory WorkReportModel.fromJson(Map<String, dynamic> json) =>
      WorkReportModel(
        hoursAssigned: json['hoursAssigned'] ?? 0,
        hoursWorked: json['hoursWorked'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'hoursAssigned': hoursAssigned,
        'hoursWorked': hoursWorked,
      };

  WorkReportModel copyWith({
    double hoursAssigned,
    double hoursWorked,
  }) {
    return WorkReportModel(
      hoursAssigned: hoursAssigned ?? this.hoursAssigned,
      hoursWorked: hoursWorked ?? this.hoursWorked,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        hoursAssigned,
        hoursWorked,
      ];
}
