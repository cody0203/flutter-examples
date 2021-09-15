part of 'pokemon_detail_bloc.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();
}

class GetPokemonDetail extends PokemonDetailEvent {
  const GetPokemonDetail({
    required this.id,
  });
  final int id;

  @override
  List<Object> get props => <Object>[id];
}
