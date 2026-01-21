import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../favourites/controllers/favourites_controller.dart';
import '../controllers/pokemon_details_provider.dart';

class PokemonDetailsPage extends ConsumerWidget {
  final int pokemonId;

  const PokemonDetailsPage({
    super.key,
    required this.pokemonId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDetails = ref.watch(pokemonDetailsProvider(pokemonId));
    final favourites = ref.watch(favouritesProvider);
    final isCaptured = favourites.contains(pokemonId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon #$pokemonId'),
      ),
      body: asyncDetails.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => _ErrorState(
          message: e.toString(),
          onRetry: () => ref.refresh(pokemonDetailsProvider(pokemonId)),
        ),
        data: (p) {
          final t = Theme.of(context).textTheme;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.network(
                    p.imageUrl,
                    height: 160,
                    width: 160,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_not_supported, size: 64),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  p.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: t.headlineSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  '#${p.id.toString().padLeft(3, '0')}',
                  textAlign: TextAlign.center,
                  style: t.labelLarge,
                ),
                const SizedBox(height: 16),

                // Info card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _InfoRow(label: 'Height', value: '${p.height}'),
                        const SizedBox(height: 8),
                        _InfoRow(label: 'Weight', value: '${p.weight}'),
                        const SizedBox(height: 8),
                        _InfoRow(label: 'Moves', value: '${p.movesCount}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Types
                Text('Types', style: t.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: p.types.map((x) => Chip(label: Text(x))).toList(),
                ),
                const SizedBox(height: 16),

                // Abilities
                Text('Abilities', style: t.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      p.abilities.map((x) => Chip(label: Text(x))).toList(),
                ),
                const SizedBox(height: 16),

                // Stats
                Text('Base Stats', style: t.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: p.stats
                          .map(
                            (s) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(s.name),
                                  Text(
                                    s.base.toString(),
                                    style: t.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Capture button
                SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    icon: Icon(isCaptured
                        ? Icons.check_circle
                        : Icons.catching_pokemon),
                    label: Text(isCaptured ? 'Captured' : 'Capture'),
                    onPressed: isCaptured
                        ? null
                        : () {
                            ref.read(favouritesProvider.notifier).capture(p.id);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${p.name.toUpperCase()} captured!',
                                ),
                              ),
                            );
                          },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.bodyMedium),
        Text(value, style: textTheme.titleMedium),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 12),
            Text(
              'Failed to load Pokémon',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
