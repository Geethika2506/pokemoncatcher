import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../network/dio_client.dart';
import '../../features/pokemon/data/sources/pokemon_api_service.dart';
import '../../features/pokemon/data/repositories/pokemon_repository_impl.dart';
import '../../features/pokemon/domain/repositories/pokemon_repository.dart';

final dioProvider = Provider<Dio>((ref) => DioClient.create());

final pokemonApiProvider = Provider<PokemonApiService>(
  (ref) => PokemonApiService(ref.watch(dioProvider)),
);

final pokemonRepoProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepositoryImpl(ref.watch(pokemonApiProvider)),
);
