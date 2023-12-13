import 'package:flutter/widgets.dart';
import 'package:flutterViper/routers/my_page_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit: MyPage Router', () {
    final router = MyPageRouter();
    test('マイページへ遷移できる', () async {
      WidgetsFlutterBinding.ensureInitialized();
      router.go();
    });
  });
}
