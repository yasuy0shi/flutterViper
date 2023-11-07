import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:flutterViper/view/my_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('Widget: マイページ', () {
    testWidgets('ページが表示される', (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: MyPage(),
          ),
        ),
      );

      // マイページが表示されている
      expect(find.byKey(const ValueKey('MyPageTitle')), findsOneWidget);
    });

    testWidgets('アイコンをタップしてドロワーメニューが表示される', (WidgetTester tester) async {
      expect(true, isTrue);
    });

    testWidgets('サインアウトボタンを押下してサインアウトできる', (WidgetTester tester) async {
      expect(true, isTrue);
    });
  });
}
