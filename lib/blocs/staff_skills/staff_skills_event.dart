part of 'staff_skills_bloc.dart';

abstract class StaffSkillsEvent extends Equatable {
  const StaffSkillsEvent();

  @override
  List<Object> get props => [];
}

class StaffSkillsEventChange extends StaffSkillsEvent {
  final List<StaffSkillModel> listStaffSkillModel;

  const StaffSkillsEventChange({@required this.listStaffSkillModel});

  @override
  List<Object> get props => [listStaffSkillModel];
}

class StaffSkillsEventGet extends StaffSkillsEvent {}
