import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesController extends StateNotifier<Set<int>> {
  FavouritesController() : super(<int>{});

  bool isCaptured(int id) => state.contains(id);

  void capture(int id) {
    state = {...state, id};
  }

  void release(int id) {
    final next = {...state}..remove(id);
    state = next;
  }

  void clearAll() {
    state = <int>{};
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesController, Set<int>>(
  (ref) => FavouritesController(),
);
