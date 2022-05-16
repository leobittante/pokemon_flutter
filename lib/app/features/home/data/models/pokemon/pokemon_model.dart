import 'package:pokemon_dex/app/features/home/data/models/pokemon/evolution_model.dart';
import 'package:pokemon_dex/app/features/home/domain/entities/pokemon/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  final int idModel;
  final String? numModel;
  final String? nameModel;
  final String? imgModel;
  final List<String>? typeModel;
  final String? heightModel;
  final String? weightModel;
  final String? candyModel;
  final String? eggModel;
  final List<EvolutionModel>? nextEvolutionModel;
  final List<EvolutionModel>? prevEvolutionModel;

  const PokemonModel(
      {required this.idModel,
      this.numModel,
      this.nameModel,
      this.imgModel,
      this.typeModel,
      this.heightModel,
      this.weightModel,
      this.candyModel,
      this.eggModel,
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
    List<EvolutionModel> listNextEvolution = [];
    if (json['next_evolution'] != null) {
      json['next_evolution'].forEach((v) {
        listNextEvolution.add(EvolutionModel.fromJson(v));
      });
    }

    List<EvolutionModel> listPrevEvolution = [];
    if (json['prev_evolution'] != null) {
      json['prev_evolution'].forEach((v) {
        listPrevEvolution.add(EvolutionModel.fromJson(v));
      });
    }

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
        nextEvolutionModel: listNextEvolution,
        prevEvolutionModel: listPrevEvolution);
  }
}
