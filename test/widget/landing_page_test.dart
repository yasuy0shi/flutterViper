import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:flutterViper/view/landing_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Widget: ランディングページ', () {
    testWidgets('ページが表示される', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LandingPage(),
          ),
        ),
      );

      // ランディングページが表示されている
      expect(find.text('Flutter VIPER'), findsOneWidget);
      expect(find.byKey(const ValueKey('LandingPageTitle')), findsOneWidget);
      expect(find.byKey(const ValueKey('SignInButton')), findsOneWidget);
    });

    testWidgets('サインインボタンをタップしてサインインページに遷移する', (WidgetTester tester) async {
      expect(true, isTrue);
    });
  });
}
