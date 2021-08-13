/*
 * Author: Trung Shin
 */
import 'package:equatable/equatable.dart';

class SkillModel extends Equatable {
  final int id;
  final String name;
  final String description;

  const SkillModel({
    this.id: 0,
    this.name: '',
    this.description: '',
  });

  static const SkillModel empty = SkillModel(
    id: 0,
    description: '',
    name: '',
  );

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };

  SkillModel copyWith({
    int status,
    int id,
    int brandId,
    String name,
    String description,
  }) {
    return SkillModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        name,
        description,
      ];
}
