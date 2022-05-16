import 'package:equatable/equatable.dart';

import 'evolution_entity.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String? num;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final String? candy;
  final String? egg;
  final List<EvolutionEntity>? nextEvolution;
  final List<EvolutionEntity>? prevEvolution;

  const PokemonEntity(
      {required this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.nextEvolution,
      this.prevEvolution});

  @override
  List<Object?> get props => [
        id,
        num,
        name,
        img,
        type,
        height,
        weight,
        candy,
        egg,
        nextEvolution,
        prevEvolution
      ];
}
