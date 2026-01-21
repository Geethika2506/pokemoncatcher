import '../../data/models/pokemon_details.dart';
import '../../data/models/pokemon_list_response.dart';

abstract class PokemonRepository {
  Future<PokemonListResponse> getPokemonList({
    required int limit,
    required int offset,
  });

  Future<PokemonDetails> getPokemonDetails(int pokemonId);
}
