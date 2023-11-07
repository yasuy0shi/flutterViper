import 'package:flutter_test/flutter_test.dart';

main() {
  group('Unit: 認証Repository', () {
    test('正しいEmailとパスワードで叩いた場合、サインインに成功する', () async {
      // // TODO: APIのモックを解除後作成する
      expect(true, isTrue);
      // TokenData tokenData = await AuthenticationApi().signIn(
      //   email: 'hoge@example.com',
      //   password: 'hoge',
      // );
      // expect(tokenData, isNotNull);
    });

    test('間違ったEmailとパスワードで叩いた場合、サインインに失敗する', () async {
      // TODO: APIのモックを解除後作成する
      expect(true, isTrue);
      // Authentication auth = Authentication(
      //   email: 'test',
      //   password: 'test',
      // );
      // expect(await AuthenticationApi().signIn(auth), throwsException);
    });
  });
}
