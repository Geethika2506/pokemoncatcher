import '../../domain/repositories/pokemon_repository.dart';
import '../models/pokemon_details.dart';
import '../models/pokemon_list_response.dart';
import '../sources/pokemon_api_service.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonApiService api;
  PokemonRepositoryImpl(this.api);

  @override
  Future<PokemonListResponse> getPokemonList({
    required int limit,
    required int offset,
  }) {
    return api.getPokemonList(limit: limit, offset: offset);
  }

  @override
  Future<PokemonDetails> getPokemonDetails(int pokemonId) {
    return api.getPokemonDetails(pokemonId);
  }
}
