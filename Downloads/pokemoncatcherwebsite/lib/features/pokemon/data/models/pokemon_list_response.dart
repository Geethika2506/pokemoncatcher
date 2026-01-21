import 'pokemon_list_item.dart';

class PokemonListResponse {
  final int count;
  final List<PokemonListItem> results;

  PokemonListResponse({required this.count, required this.results});

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      count: json['count'] as int,
      results: (json['results'] as List)
          .map((e) => PokemonListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
