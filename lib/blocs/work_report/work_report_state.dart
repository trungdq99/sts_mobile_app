part of 'work_report_bloc.dart';

enum WorkReportStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class WorkReportState extends Equatable {
  final WorkReportStatus status;
  final WorkReportModel workReportModel;
  final String message;
  const WorkReportState({
    this.status: WorkReportStatus.initial,
    this.workReportModel: WorkReportModel.empty,
    this.message: '',
  });

  WorkReportState copyWith({
    WorkReportStatus status,
    WorkReportModel workReportModel,
    String message,
  }) =>
      WorkReportState(
        status: status ?? this.status,
        workReportModel: workReportModel ?? this.workReportModel,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        workReportModel,
        message,
      ];
}
