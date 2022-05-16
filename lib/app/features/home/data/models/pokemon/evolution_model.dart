import '../../../domain/entities/pokemon/evolution_entity.dart';

class EvolutionModel extends EvolutionEntity {
  final String? numModel;
  final String? nameModel;

  const EvolutionModel({this.numModel, this.nameModel})
      : super(name: nameModel, num: numModel);

  factory EvolutionModel.fromJson(Map<String, dynamic> json) {
    return EvolutionModel(
      numModel: json['num'],
      nameModel: json['name'],
    );
  }
}
