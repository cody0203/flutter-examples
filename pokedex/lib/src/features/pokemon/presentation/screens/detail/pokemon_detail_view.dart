import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/detail/pokemon_detail_bloc.dart';

class PokemonDetailView extends StatelessWidget {
  const PokemonDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
        builder: (_, PokemonDetailState state) {
      if (state is PokemonDetailInit) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is PokemonDetailLoaded) {
        return SlidingUpPanel(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          minHeight: MediaQuery.of(context).size.height,
          borderRadius: BorderRadius.circular(40),
          boxShadow: null,
          color: Colors.transparent,
          header: Container(
            width: 170,
            height: 170,
            child: FadeInImage(
              image: NetworkImage(
                state.pokemon.avatar,
              ),
              placeholder:
                  const AssetImage('assets/images/pokeball_gradient.png'),
              fit: BoxFit.contain,
            ),
          ),
          panel: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 134),
              color: Colors.white,
              child: Text('test'),
            ),
          ),
        );
      }

      return const SizedBox();
    });
  }
}
