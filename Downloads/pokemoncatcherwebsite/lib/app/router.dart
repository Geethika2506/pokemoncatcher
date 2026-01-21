import 'package:go_router/go_router.dart';

import '../features/pokemon/presentation/pages/pokemon_list_page.dart';
import '../features/pokemon/presentation/pages/pokemon_details_page.dart';
import '../features/favourites/presentation/pages/favourites_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const PokemonListPage(),
      routes: [
        GoRoute(
          path: 'pokemon/:id',
          builder: (_, state) {
            final id = int.parse(state.pathParameters['id']!);
            return PokemonDetailsPage(pokemonId: id);
          },
        ),
        GoRoute(
          path: 'favourites',
          builder: (_, __) => const FavouritesPage(),
        ),
      ],
    ),
  ],
);
