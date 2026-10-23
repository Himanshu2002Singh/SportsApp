import 'package:flutter_test/flutter_test.dart';
import 'package:sports_app/main.dart';

void main() {
  testWidgets('Sports App loads LoginMethodScreen with login options',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SportsApp());
    await tester.pump(const Duration(milliseconds: 200));

    // Verify Page 1 elements
    expect(find.text('India'), findsOneWidget);
    expect(find.text('Login with'), findsOneWidget);
    expect(find.text('WhatsApp'), findsOneWidget);
    expect(find.text('Mobile number'), findsOneWidget);
    expect(find.text('Explore as a guest'), findsOneWidget);
  });
}
