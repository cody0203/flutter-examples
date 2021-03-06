// Mocks generated by Mockito 5.0.14 from annotations
// in pokedex/test/features/pokemon/data/repositories/pokemon_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex/src/features/pokemon/data/datasources/pokemon_data_source.dart'
    as _i3;
import 'package:pokedex/src/features/pokemon/data/models/detail/pokemon.dart'
    as _i6;
import 'package:pokedex/src/features/pokemon/data/models/list/pokemon_list.dart'
    as _i5;
import 'package:retrofit/retrofit.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeHttpResponse_0<T> extends _i1.Fake implements _i2.HttpResponse<T> {}

/// A class which mocks [PokemonDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonDataSource extends _i1.Mock implements _i3.PokemonDataSource {
  MockPokemonDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.HttpResponse<_i5.PokemonListModel>> getPokemonList(
          {int? page}) =>
      (super.noSuchMethod(Invocation.method(#getPokemonList, [], {#page: page}),
              returnValue: Future<_i2.HttpResponse<_i5.PokemonListModel>>.value(
                  _FakeHttpResponse_0<_i5.PokemonListModel>()))
          as _i4.Future<_i2.HttpResponse<_i5.PokemonListModel>>);
  @override
  _i4.Future<_i2.HttpResponse<_i6.PokemonDetailModel>> getPokemon({int? id}) =>
      (super.noSuchMethod(Invocation.method(#getPokemon, [], {#id: id}),
          returnValue: Future<_i2.HttpResponse<_i6.PokemonDetailModel>>.value(
              _FakeHttpResponse_0<_i6.PokemonDetailModel>())) as _i4
          .Future<_i2.HttpResponse<_i6.PokemonDetailModel>>);
  @override
  String toString() => super.toString();
}
