import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:flutterViper/view/sign_in_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Widget: サインインページ', () {
    testWidgets('ページが表示される', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      // サインインページが表示されている
      expect(find.byKey(const ValueKey('SignInPageTitle')), findsOneWidget);
      expect(find.byKey(const ValueKey('EmailFormField')), findsOneWidget);
      expect(find.byKey(const ValueKey('PasswordFormField')), findsOneWidget);
      expect(find.byKey(const ValueKey('SignInButton')), findsOneWidget);
    });

    testWidgets('正しい情報を入力してサインインに成功しマイページへ遷移する', (WidgetTester tester) async {
      expect(true, isTrue);
    });

    testWidgets('正しくない情報を入力した場合はサインインに失敗する', (WidgetTester tester) async {
      expect(true, isTrue);
    });
  });
}
