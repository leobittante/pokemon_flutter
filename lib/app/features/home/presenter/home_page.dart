import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_dex/app/core/dialogs/app_dialogs.dart';
import 'package:pokemon_dex/app/core/style/app_text_styles.dart';
import 'package:pokemon_dex/app/features/home/domain/entities/pokemon/pokemon_entity.dart';
import 'package:pokemon_dex/app/features/home/presenter/widget/button_reload_widget.dart';

import '../../../app_routes.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/utils/assert_route.dart';
import 'cubit/get_pokemon_list_cubit.dart';
import 'widget/list_view_card_widget.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonEntity> pokemonList = [];
  bool animationForward = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Modular.get<GetPokemonListCubit>().getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<GetPokemonListCubit, GetPokemonListState>(
      bloc: Modular.get<GetPokemonListCubit>(),
      builder: (context, state) {
        if (state is GetPokemonListInitial) {}

        if (state is GetPokemonListLoading) {
          loading = true;
        }
        if (state is GetPokemonListSuccess) {
          loading = false;
          pokemonList = state.response.pokemon;
        }
        if (state is GetPokemonListError) {
          loading = false;
        }

        return Scaffold(
          backgroundColor: AppColors.defaultPurple,
          body: SafeArea(
            child: SizedBox(
              height: size.height * .9,
              width: size.width,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => exit(),
                          child: const Icon(Icons.exit_to_app,
                              color: AppColors.white)),
                      Text(
                        'Olá, ' + widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.welcomeHomeTitle,
                      ),
                      ButtonReloadWidget(
                          loading: loading,
                          size: size,
                          onTap: () {
                            setState(() {
                              pokemonList.clear();
                              loading = true;
                            });
                            Modular.get<GetPokemonListCubit>().getPokemonList();
                          })
                    ],
                  ),
                ),
                if (pokemonList.isNotEmpty) ...[
                  Expanded(
                    child: ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return ListViewCardWidget(
                            size: size,
                            pokemon: pokemonList[index],
                          );
                        }),
                  )
                ]
              ]),
            ),
          ),
        );
      },
    );
  }

  void exit() {
    AppDialog.exit(context, 'Deseja sair do App?',
        actionExit: () =>
            Modular.to.pushReplacementNamed(assertRoute(AppRoutes.login)));
  }
}
