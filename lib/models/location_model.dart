import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final int id;
  final String name;

  const LocationModel({
    this.id,
    this.name,
  });

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
