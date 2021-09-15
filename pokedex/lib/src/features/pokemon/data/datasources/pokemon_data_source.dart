
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/main_constants.dart';
import '../models/detail/pokemon.dart';
import '../models/list/pokemon_list.dart';

part 'pokemon_data_source.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class PokemonDataSource {
  factory PokemonDataSource(
    Dio dio, {
    String baseUrl,
  }) = _PokemonDataSource;

  @GET('/pokemons')
  Future<HttpResponse<PokemonListModel>> getPokemonList({
    @Query('page') required int page,
  });

  @GET('/pokemon/details/{id}')
  Future<HttpResponse<PokemonDetailModel>> getPokemon({
    @Path('id') required int id,
  });
}
