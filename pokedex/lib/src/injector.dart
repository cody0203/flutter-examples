import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/src/features/pokemon/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:pokedex/src/features/pokemon/presentation/blocs/list/pokemon_list_bloc.dart';
import 'package:pokedex/src/features/pokemon/presentation/blocs/detail/pokemon_detail_bloc.dart';

import 'features/pokemon/data/datasources/pokemon_data_source.dart';
import 'features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'features/pokemon/domain/repositories/pokemon_repository.dart';
import 'features/pokemon/domain/usecases/get_pokemon_list_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory<PokemonListBloc>(
      () => PokemonListBloc(getPokemonListUsecase: sl()));

  sl.registerFactory<PokemonDetailBloc>(
      () => PokemonDetailBloc(getPokemonDetailUsecase: sl()));

  // Network
  sl.registerLazySingleton(() => Dio());

  // Usecases
  sl.registerLazySingleton<GetPokemonListUsecase>(
      () => GetPokemonListUsecase(sl()));

  sl.registerLazySingleton<GetPokemonDetailUsecase>(
      () => GetPokemonDetailUsecase(sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(sl()));

  // Datasource
  sl.registerLazySingleton<PokemonDataSource>(() => PokemonDataSource(sl()));
}
