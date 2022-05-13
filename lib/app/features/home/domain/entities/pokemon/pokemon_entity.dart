import 'package:equatable/equatable.dart';

import 'next_evolution_entity.dart';
import 'prev_evolution_entity.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final String egg;
  final List<NextEvolutionEntity>? nextEvolution;
  final List<PrevEvolutionEntity>? prevEvolution;

  const PokemonEntity(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.candy,
      required this.egg,
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
