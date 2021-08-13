part of 'skills_bloc.dart';

abstract class SkillsEvent extends Equatable {
  const SkillsEvent();

  @override
  List<Object> get props => [];
}

class SkillsEventChanged extends SkillsEvent {
  final List<SkillModel> listSkills;
  const SkillsEventChanged({
    @required this.listSkills,
  });
  @override
  List<Object> get props => [listSkills];
}

class SkillsEventGet extends SkillsEvent {}
