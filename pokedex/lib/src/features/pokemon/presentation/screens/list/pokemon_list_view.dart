import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/bloc_with_state.dart';
import '../../../../../shared/widgets/bottom_loader.dart';
import '../../../../../shared/widgets/infinite_list.dart';
import '../../../domain/entities/list/pokemon_list.dart';
import '../../blocs/list/pokemon_list_bloc.dart';
import '../../widgets/list/pokemon_list_item.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      builder: (_, PokemonListState state) {
        if (state is PokemonListInit) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is PokemonListLoaded) {
          final PokemonList pokemonList = state.pokemonList;

          if (pokemonList.pokemons.isEmpty) {
            return const Center(
              child: Text('No pokemons found'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InfiniteList(
                itemCount: pokemonList.currentPage == pokemonList.totalPages
                    ? pokemonList.pokemons.length
                    : pokemonList.pokemons.length + 1,
                currentPage: pokemonList.currentPage,
                totalPages: pokemonList.totalPages,
                threshold: 0.8,
                blocAction: () {
                  if (context.read<PokemonListBloc>().blocProcessState ==
                      BlocProcessState.idle) {
                    context.read<PokemonListBloc>().add(
                          GetPokemonList(page: pokemonList.currentPage + 1),
                        );
                  }
                },
                onRefreshAction: () {
                  context.read<PokemonListBloc>().add(
                        const GetPokemonList(page: 1, isRefresh: true),
                      );
                },
                itemBuilder: (_, int index) {
                  return index >= pokemonList.pokemons.length
                      ? BottomLoader()
                      : PokemonListItem(
                          pokemon: pokemonList.pokemons[index],
                        );
                },
              ),
            );
          }
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
