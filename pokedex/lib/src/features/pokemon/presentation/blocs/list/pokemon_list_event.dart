part of 'pokemon_list_bloc.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();
}

class GetPokemonList extends PokemonListEvent {
  const GetPokemonList({
    required this.page,
    this.isRefresh,
  });
  final int page;
  final bool? isRefresh;

  @override
  List<Object?> get props => <Object?>[
        page,
        isRefresh,
      ];
}
