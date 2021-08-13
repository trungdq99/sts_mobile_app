part of 'work_report_bloc.dart';

abstract class WorkReportEvent extends Equatable {
  const WorkReportEvent();

  @override
  List<Object> get props => [];
}

class WorkReportEventGet extends WorkReportEvent {
  final DateTimeRange selectedWeek;
  const WorkReportEventGet({@required this.selectedWeek});
  @override
  List<Object> get props => [
        selectedWeek,
      ];
}
