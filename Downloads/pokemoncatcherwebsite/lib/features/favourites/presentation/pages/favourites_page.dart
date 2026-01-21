import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/favourites_controller.dart';

class FavouritesPage extends ConsumerWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ids = ref.watch(favouritesProvider).toList()..sort();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favourites'),
        actions: [
          if (ids.isNotEmpty)
            IconButton(
              tooltip: 'Clear all',
              icon: const Icon(Icons.delete_outline),
              onPressed: () => ref.read(favouritesProvider.notifier).clearAll(),
            ),
        ],
      ),
      body: ids.isEmpty
          ? const Center(child: Text('No Pokémon captured yet.'))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: ids.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                final id = ids[i];
                final imageUrl =
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

                return Card(
                  child: ListTile(
                    leading: Image.network(
                      imageUrl,
                      height: 48,
                      width: 48,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.image_not_supported),
                    ),
                    title: Text('Pokémon #${id.toString().padLeft(3, '0')}'),
                    subtitle: const Text('Tap to view details'),
                    trailing: IconButton(
                      tooltip: 'Remove',
                      icon: const Icon(Icons.close),
                      onPressed: () =>
                          ref.read(favouritesProvider.notifier).release(id),
                    ),
                    onTap: () => context.go('/pokemon/$id'),
                  ),
                );
              },
            ),
    );
  }
}
