import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/pokemon_list_item.dart';
import '../../../../core/di/providers.dart';

class PokemonListState {
  final List<PokemonListItem> items;
  final bool isLoading;
  final bool hasMore;
  final String? error;

  const PokemonListState({
    this.items = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.error,
  });

  PokemonListState copyWith({
    List<PokemonListItem>? items,
    bool? isLoading,
    bool? hasMore,
    String? error,
  }) {
    return PokemonListState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }
}

class PokemonListController extends StateNotifier<PokemonListState> {
  PokemonListController(this.ref) : super(const PokemonListState());

  final Ref ref;

  static const int _pageSize = 20;
  int _offset = 0;

  Future<void> loadInitial() async {
    state = const PokemonListState(isLoading: true);
    _offset = 0;
    await _fetchNext(clear: true);
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    await _fetchNext();
  }

  Future<void> _fetchNext({bool clear = false}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final repo = ref.read(pokemonRepoProvider);
      final res = await repo.getPokemonList(limit: _pageSize, offset: _offset);

      final newItems = res.results;
      final merged = clear ? newItems : [...state.items, ...newItems];

      _offset += _pageSize;

      final hasMore = merged.length < res.count;

      state = state.copyWith(items: merged, isLoading: false, hasMore: hasMore);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final pokemonListControllerProvider =
    StateNotifierProvider<PokemonListController, PokemonListState>(
      (ref) => PokemonListController(ref)..loadInitial(),
    );
