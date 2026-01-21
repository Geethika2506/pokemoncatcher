import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pokedex/app/app.dart';

void main() {
  testWidgets('Pokédex app loads', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: App(),
      ),
    );

    // Let initial frames & async providers settle
    await tester.pumpAndSettle();

    // Verify Pokédex title is shown
    expect(find.text('Pokédex'), findsOneWidget);
  });
}
