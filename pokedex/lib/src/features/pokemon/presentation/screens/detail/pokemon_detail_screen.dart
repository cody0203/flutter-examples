import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/enums/type.dart';
import 'package:pokedex/src/core/params/detail_params.dart';

import 'package:pokedex/src/features/pokemon/presentation/blocs/detail/pokemon_detail_bloc.dart';
import 'package:pokedex/src/features/pokemon/presentation/screens/detail/pokemon_detail_view.dart';
import '../../../../../injector.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({Key? key}) : super(key: key);
  static const String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final DetailParams routeArg =
        ModalRoute.of(context)?.settings.arguments as DetailParams;
    final List<Color> pokemonType = mapTypeEnumToGradientColor[routeArg.type]!;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: pokemonType,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: BlocProvider<PokemonDetailBloc>(
            create: (_) => sl<PokemonDetailBloc>()
              ..add(
                GetPokemonDetail(id: routeArg.id),
              ),
            child: const PokemonDetailView(),
          ),
        ),
      ],
    );
  }
}
