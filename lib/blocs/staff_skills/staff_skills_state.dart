part of 'staff_skills_bloc.dart';

enum StaffSkillsStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class StaffSkillsState extends Equatable {
  final StaffSkillsStatus status;
  final List<StaffSkillModel> listStaffSkills;
  final String message;

  const StaffSkillsState({
    this.status: StaffSkillsStatus.initial,
    this.listStaffSkills: const [],
    this.message: '',
  });

  StaffSkillsState copyWith({
    StaffSkillsStatus status,
    List<StaffSkillModel> listStaffSkills,
    String message,
  }) =>
      StaffSkillsState(
        status: status ?? this.status,
        listStaffSkills: listStaffSkills ?? this.listStaffSkills,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        listStaffSkills,
        message,
      ];
}
