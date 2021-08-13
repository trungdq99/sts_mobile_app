part of 'skills_bloc.dart';

enum SkillsStatus {
  initial,
  loading,
  loadingSuccessful,
  loadingFailure,
}

class SkillsState extends Equatable {
  final SkillsStatus status;
  final List<SkillModel> listSkills;
  final String message;
  const SkillsState({
    this.status: SkillsStatus.initial,
    this.listSkills: const [],
    this.message: '',
  });

  SkillsState copyWith({
    SkillsStatus status,
    List<SkillModel> listSkills,
    String message,
  }) =>
      SkillsState(
        status: status ?? this.status,
        listSkills: listSkills ?? this.listSkills,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [
        status,
        listSkills,
        message,
      ];
}
