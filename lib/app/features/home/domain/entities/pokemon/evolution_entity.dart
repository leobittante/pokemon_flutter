import 'package:equatable/equatable.dart';

class EvolutionEntity extends Equatable {
  final String? num;
  final String? name;

  const EvolutionEntity({this.num, this.name});

  @override
  List<Object?> get props => [num, name];
}
