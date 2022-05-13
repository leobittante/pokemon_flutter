import 'package:pokemon_dex/app/features/home/domain/entities/pokemon/pokemon_entity.dart';

import 'next_evolution_model.dart';
import 'prev_evolution_model.dart';

class PokemonModel extends PokemonEntity {
  final int idModel;
  final String numModel;
  final String nameModel;
  final String imgModel;
  final List<String> typeModel;
  final String heightModel;
  final String weightModel;
  final String candyModel;
  final String eggModel;
  final List<NextEvolutionModel>? nextEvolutionModel;
  final List<PrevEvolutionModel>? prevEvolutionModel;

  const PokemonModel(
      {required this.idModel,
      required this.numModel,
      required this.nameModel,
      required this.imgModel,
      required this.typeModel,
      required this.heightModel,
      required this.weightModel,
      required this.candyModel,
      required this.eggModel,
      this.nextEvolutionModel,
      this.prevEvolutionModel})
      : super(
            id: idModel,
            num: numModel,
            name: nameModel,
            img: imgModel,
            type: typeModel,
            height: heightModel,
            weight: weightModel,
            candy: candyModel,
            egg: eggModel,
            nextEvolution: nextEvolutionModel,
            prevEvolution: prevEvolutionModel);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<NextEvolutionModel> listNextEvolution = [];
    List<PrevEvolutionModel> listPrevEvolution = [];

    return PokemonModel(
        idModel: json['id'],
        numModel: json['num'],
        nameModel: json['name'],
        imgModel: json['img'],
        typeModel: json['type'].cast<String>(),
        heightModel: json['height'],
        weightModel: json['weight'],
        candyModel: json['candy'],
        eggModel: json['egg'],
        nextEvolutionModel: json['next_evolution'].forEach((v) {
          listNextEvolution.add(NextEvolutionModel.fromJson(v));
        }),
        prevEvolutionModel: json['prev_evolution'].forEach((v) {
          listPrevEvolution.add(PrevEvolutionModel.fromJson(v));
        }));
  }
}
