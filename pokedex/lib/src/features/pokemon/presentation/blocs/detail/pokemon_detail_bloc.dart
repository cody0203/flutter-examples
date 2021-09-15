import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/bloc/bloc_with_state.dart';
import '../../../../../core/params/detail_params.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/detail/pokemon.dart';
import '../../../domain/usecases/get_pokemon_detail_usecase.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc
    extends BlocWithState<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc({
    required this.getPokemonDetailUsecase,
  }) : super(const PokemonDetailInit());

  final GetPokemonDetailUsecase getPokemonDetailUsecase;
  @override
  Stream<PokemonDetailState> mapEventToState(PokemonDetailEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetPokemonDetail) {
      yield* _mapPokemonDetailToState(event);
    }
  }

  Stream<PokemonDetailState> _mapPokemonDetailToState(
      GetPokemonDetail event) async* {
    yield* runBlocProcess(
      () async* {
        try {
          final DataState<PokemonDetail> response =
              await getPokemonDetailUsecase(
            params: DetailParams(
              id: event.id,
            ),
          );

          if (response is DataSuccess) {
            yield PokemonDetailLoaded(pokemon: response.data!);
          }

          if (response is DataFailure) {
            throw response.error!;
          }
        } on DioError catch (error) {
          yield PokemonDetailError(error: error);
        }
      },
    );
  }
}
