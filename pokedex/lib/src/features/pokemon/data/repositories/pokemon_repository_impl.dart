import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/src/features/pokemon/data/models/detail/pokemon.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/params/detail_params.dart';
import '../../../../core/params/search_params.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/detail/pokemon.dart';
import '../../domain/entities/list/pokemon_list.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_data_source.dart';

import '../models/list/pokemon_list.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  const PokemonRepositoryImpl(this._pokemonDataSource);
  final PokemonDataSource _pokemonDataSource;

  @override
  Future<DataState<PokemonList>> getPokemonList({
    int? page,
  }) async {
    try {
      final HttpResponse<PokemonListModel> httpResponse =
          await _pokemonDataSource.getPokemonList(page: page ?? 1);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess<PokemonList>(httpResponse.data);
      }

      return DataFailure<PokemonList>(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (error) {
      return DataFailure<PokemonList>(error);
    }
  }

  @override
  Future<DataState<PokemonDetail>> getPokemon({
    required int id,
  }) async {
    try {
      final HttpResponse<PokemonDetailModel> httpResponse =
          await _pokemonDataSource.getPokemon(
        id: id,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess<PokemonDetail>(httpResponse.data);
      }

      return DataFailure<PokemonDetail>(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (error) {
      return DataFailure<PokemonDetail>(error);
    }
  }

  @override
  Future<DataState<PokemonList>> searchPokemonByName({
    required SearchParams params,
  }) {
    return 'a' as Future<DataState<PokemonList>>;
  }
}
