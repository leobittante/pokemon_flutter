import '../../../domain/entities/pokemon/next_evolution_entity.dart';

class NextEvolutionModel extends NextEvolutionEntity {
  final String numModel;
  final String nameModel;

  const NextEvolutionModel({required this.numModel, required this.nameModel})
      : super(name: nameModel, num: numModel);

  factory NextEvolutionModel.fromJson(Map<String, dynamic> json) {
    return NextEvolutionModel(
      numModel: json['num'],
      nameModel: json['name'],
    );
  }
}
