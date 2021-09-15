import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/bloc/bloc_with_state.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/params/list_params.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/list/pokemon.dart';
import '../../../domain/entities/list/pokemon_list.dart';
import '../../../domain/usecases/get_pokemon_list_usecase.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc
    extends BlocWithState<PokemonListEvent, PokemonListState> {
  PokemonListBloc({
    required this.getPokemonListUsecase,
  }) : super(PokemonListInit());
  final GetPokemonListUsecase getPokemonListUsecase;
  List<PokemonInList> _pokemons = [];
  int _currentPage = 0;

  @override
  Stream<Transition<PokemonListEvent, PokemonListState>> transformEvents(
      Stream<PokemonListEvent> events,
      TransitionFunction<PokemonListEvent, PokemonListState> transitionFn) {
    return super.transformEvents(
      events.throttleTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<PokemonListState> mapEventToState(PokemonListEvent event) async* {
    if (event is GetPokemonList) {
      yield* _mapPokemonListToState(event);
    }
  }

  Stream<PokemonListState> _mapPokemonListToState(GetPokemonList event) async* {
    try {
      if (event.page == _currentPage) return;
      final DataState<PokemonList> response = await getPokemonListUsecase(
        params: ListParams(page: event.page),
      );

      if (response is DataSuccess) {
        if (event.isRefresh ?? false) {
          _pokemons = <PokemonInList>[...response.data!.pokemons];
        } else {
          _pokemons = <PokemonInList>[
            ..._pokemons,
            ...response.data!.pokemons,
          ];
        }
        final PokemonList newPokemonList = PokemonList(
          currentPage: event.page,
          totalPages: response.data!.totalPages,
          pokemons: _pokemons,
        );
        _currentPage = event.page;
        yield PokemonListLoaded(pokemonList: newPokemonList);
      }

      if (response is DataFailure) {
        throw response.error!;
      }
    } on DioError catch (error) {
      yield PokemonListError(error: error);
    }
  }
}
