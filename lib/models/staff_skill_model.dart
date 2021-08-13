/*
 * Author: Trung Shin
 */

import 'package:equatable/equatable.dart';

class StaffSkillModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final int level;

  const StaffSkillModel({
    this.id: 0,
    this.name: '',
    this.description: '',
    this.level: 0,
  });

  static const StaffSkillModel empty = StaffSkillModel(
    id: 0,
    name: '',
    description: '',
    level: 0,
  );

  factory StaffSkillModel.fromJson(Map<String, dynamic> json) =>
      StaffSkillModel(
        id: json['skillId'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        level: json['level'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'level': level,
      };

  StaffSkillModel copyWith({
    int id,
    String name,
    String description,
    int level,
  }) {
    return StaffSkillModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      level: level ?? this.level,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      level,
    ];
  }
}
