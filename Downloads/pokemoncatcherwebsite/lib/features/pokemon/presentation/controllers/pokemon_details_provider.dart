import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/providers.dart';
import '../../data/models/pokemon_details.dart';

/// Fetches Pokémon details for a given [pokemonId].
/// Automatically cached by Riverpod per ID.
final pokemonDetailsProvider =
    FutureProvider.family<PokemonDetails, int>((ref, pokemonId) async {
  final repository = ref.watch(pokemonRepoProvider);
  return repository.getPokemonDetails(pokemonId);
});
