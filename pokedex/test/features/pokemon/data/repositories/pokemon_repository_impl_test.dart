import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/src/features/pokemon/domain/entities/list/pokemon_list.dart';
import 'package:pokedex/src/features/pokemon/domain/entities/detail/pokemon.dart';
import 'package:pokedex/src/features/pokemon/data/datasources/pokemon_data_source.dart';
import 'package:pokedex/src/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex/src/features/pokemon/data/models/list/pokemon_list.dart';
import 'package:pokedex/src/features/pokemon/data/models/detail/pokemon.dart';
import 'package:pokedex/src/core/constants/main_constants.dart';
import 'package:pokedex/src/core/params/detail_params.dart';
import 'package:pokedex/src/core/resources/data_state.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../mocks/pokemon.dart';
import 'pokemon_repository_impl_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<PokemonDataSource>(
    as: #MockPokemonDataSource,
  )
])
void main() {
  late PokemonRepositoryImpl pokemonRepositoryImpl;
  late MockPokemonDataSource mockPokemonDataSource;
  final dio = Dio(BaseOptions(baseUrl: kBaseUrl));
  final dioAdapter = DioAdapter(dio: dio);
  dio.httpClientAdapter = dioAdapter;

  setUp(() {
    mockPokemonDataSource = MockPokemonDataSource();
    pokemonRepositoryImpl = PokemonRepositoryImpl(mockPokemonDataSource);
  });

  group('getPokemonList', () {
    final String path = '/pokemons';
    test(
      'should return data when call to api is successful',
      () async {
        // arrange
        dioAdapter
          ..onGet(
            path,
            (server) => server.reply(
              200,
              fixture('pokemon_list.json'),
            ),
          );

        final response = await dio.get(path);
        final HttpResponse<PokemonListModel> httpResponse = HttpResponse(
          tPokemonListModel,
          response,
        );

        when(mockPokemonDataSource.getPokemonList(page: 1))
            .thenAnswer((_) async => httpResponse);

        // act
        final result = await pokemonRepositoryImpl.getPokemonList(page: 1);

        //assert
        expect(
          result,
          equals(DataSuccess<PokemonList>(httpResponse.data)),
        );
        verify(mockPokemonDataSource.getPokemonList(page: 1));
      },
    );

    test(
      'should return error when call to api is unsuccessful',
      () async {
        // arrange
        final response = await dio.get(path);
        final HttpResponse<PokemonListModel> httpResponse = HttpResponse(
          tPokemonListModel,
          response,
        );

        final error = DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        );

        when(mockPokemonDataSource.getPokemonList(page: 1)).thenThrow(error);

        // act
        final result = await pokemonRepositoryImpl.getPokemonList(page: 1);

        //assert
        verify(mockPokemonDataSource.getPokemonList(page: 1));
        verifyNoMoreInteractions(mockPokemonDataSource);
        expect(result, equals(DataFailure<PokemonList>(error)));
      },
    );
  });

  group('get PokemonDetail', () {
    final String path = '/pokemon/details/1';

    test(
      'should return data when call to api is successful',
      () async {
        // arrange
        dioAdapter
          ..onGet(
            path,
            (server) => server.reply(
              200,
              fixture('pokemon_detail.json'),
            ),
          );
        final response = await dio.get(path);
        final HttpResponse<PokemonDetailModel> httpResponse =
            HttpResponse(tPokemonDetailModel, response);

        when(mockPokemonDataSource.getPokemon(id: 1))
            .thenAnswer((_) async => httpResponse);

        // act
        final result = await pokemonRepositoryImpl.getPokemon(
          id: 1,
        );
        //assert
        expect(
          result,
          equals(DataSuccess<PokemonDetail>(httpResponse.data)),
        );
        verify(mockPokemonDataSource.getPokemon(id: 1));
      },
    );
    test(
      'should return error when call to api is unsuccessful',
      () async {
        // arrange
        final response = await dio.get(path);
        final HttpResponse<PokemonDetailModel> httpResponse =
            HttpResponse(tPokemonDetailModel, response);

        final error = DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        );

        when(mockPokemonDataSource.getPokemon(id: 1)).thenThrow(error);
        // act

        final result = await pokemonRepositoryImpl.getPokemon(id: 1);
        //assert
        verify(mockPokemonDataSource.getPokemon(id: 1));
        verifyNoMoreInteractions(mockPokemonDataSource);
        expect(result, equals(DataFailure<PokemonDetail>(error)));
      },
    );
  });
}
