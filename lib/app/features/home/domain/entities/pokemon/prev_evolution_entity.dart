import 'package:equatable/equatable.dart';

class PrevEvolutionEntity extends Equatable {
  final String num;
  final String name;

  const PrevEvolutionEntity({required this.num, required this.name});

  @override
  List<Object?> get props => [num, name];
}
