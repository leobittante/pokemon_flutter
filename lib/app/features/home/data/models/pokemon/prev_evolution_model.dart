import '../../../domain/entities/pokemon/prev_evolution_entity.dart';

class PrevEvolutionModel extends PrevEvolutionEntity {
  final String numModel;
  final String nameModel;

  const PrevEvolutionModel({required this.numModel, required this.nameModel})
      : super(name: nameModel, num: numModel);

  factory PrevEvolutionModel.fromJson(Map<String, dynamic> json) {
    return PrevEvolutionModel(
      numModel: json['num'],
      nameModel: json['name'],
    );
  }
}
