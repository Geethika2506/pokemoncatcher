import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../models/pokemon_list_response.dart';
import '../models/pokemon_details.dart';

class PokemonApiService {
  final Dio dio;
  PokemonApiService(this.dio);

  /// Fetch paginated Pokémon list
  Future<PokemonListResponse> getPokemonList({
    required int limit,
    required int offset,
  }) async {
    final res = await dio.get(
      ApiEndpoints.pokemon,
      queryParameters: {'limit': limit, 'offset': offset},
    );
    return PokemonListResponse.fromJson(res.data as Map<String, dynamic>);
  }

  /// Fetch Pokémon details by ID
  Future<PokemonDetails> getPokemonDetails(int pokemonId) async {
    final res = await dio.get(
      '${ApiEndpoints.pokemon}/$pokemonId',
    );
    return PokemonDetails.fromJson(res.data as Map<String, dynamic>);
  }
}
