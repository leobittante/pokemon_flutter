import 'package:equatable/equatable.dart';

class NextEvolutionEntity extends Equatable {
  final String num;
  final String name;

  const NextEvolutionEntity({required this.num, required this.name});

  @override
  List<Object?> get props => [num, name];
}
