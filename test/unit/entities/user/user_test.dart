import 'package:flutterViper/entities/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit: User Entity', () {
    test('初期化できる', () async {
      final user = User(id: 1, name: 'hoge');

      expect(user.id, 1);
      expect(user.name, 'hoge');
    });
  });
}
