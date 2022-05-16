import 'package:flutter/material.dart';

import '../../../../core/style/app_text_styles.dart';
import '../../../../core/utils/pokemon_colors_background_card.dart';
import '../../domain/entities/pokemon/pokemon_entity.dart';

class ListViewCardWidget extends StatelessWidget {
  final Size size;
  final PokemonEntity pokemon;
  const ListViewCardWidget(
      {Key? key, required this.pokemon, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        height: size.height * .2,
        width: size.width * .1,
        decoration: BoxDecoration(
          color: PokemonColorsBackGroundCard.getColorType(
              type: pokemon.type!.first.toString()),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: size.width * .25,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  pokemon.img!,
                  fit: BoxFit.scaleDown,
                  scale: .17,
                ),
              ),
            ),
            Text(pokemon.name.toString(), style: AppTextStyles.pokemonCard),
          ],
        ),
      ),
    );
  }
}
