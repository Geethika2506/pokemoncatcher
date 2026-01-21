class PokemonDetails {
  final int id;
  final String name;

  final int height;
  final int weight;

  final List<String> types;
  final List<String> abilities;

  final List<PokemonStat> stats;
  final int movesCount;

  final String imageUrl;

  const PokemonDetails({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.stats,
    required this.movesCount,
    required this.imageUrl,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    final id = (json['id'] as int?) ?? 0;

    final sprites = json['sprites'] as Map<String, dynamic>?;
    final spriteUrl = sprites?['front_default'] as String?;

    final types = (json['types'] as List? ?? [])
        .map((t) => (t as Map<String, dynamic>)['type']['name'] as String)
        .toList();

    final abilities = (json['abilities'] as List? ?? [])
        .map((a) => (a as Map<String, dynamic>)['ability']['name'] as String)
        .toList();

    final stats = (json['stats'] as List? ?? [])
        .map((s) => PokemonStat.fromJson(s as Map<String, dynamic>))
        .toList();

    final movesCount = (json['moves'] as List?)?.length ?? 0;

    return PokemonDetails(
      id: id,
      name: (json['name'] as String?) ?? 'unknown',
      height: (json['height'] as int?) ?? 0,
      weight: (json['weight'] as int?) ?? 0,
      types: types,
      abilities: abilities,
      stats: stats,
      movesCount: movesCount,
      imageUrl: spriteUrl ??
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}

class PokemonStat {
  final String name;
  final int base;

  const PokemonStat({
    required this.name,
    required this.base,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    final statObj = json['stat'] as Map<String, dynamic>?;
    return PokemonStat(
      base: (json['base_stat'] as int?) ?? 0,
      name: (statObj?['name'] as String?) ?? 'unknown',
    );
  }
}
