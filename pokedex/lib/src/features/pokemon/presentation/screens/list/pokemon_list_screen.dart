import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/shared/widgets/app_bar_list.dart';

import '../../../../../injector.dart';
import '../../blocs/list/pokemon_list_bloc.dart';
import 'pokemon_list_view.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({Key? key}) : super(key: key);
  static const String routeName = '/pokemons/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarList(),
      body: BlocProvider<PokemonListBloc>(
        create: (_) => sl<PokemonListBloc>()
          ..add(const GetPokemonList(
            page: 1,
          )),
        child: const PokemonListView(),
      ),
    );
  }
}
