import 'package:flutter_test/flutter_test.dart';
import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/interactors/authentication/sign_in_interactor.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_response.dart';

import '../../../mock/infra/gateways/authentication/mock_sign_in_fail_repository.dart';
import '../../../mock/infra/gateways/authentication/mock_sign_in_success_repository.dart';

main() {
  group('Unit: サインインするInteractor', () {
    test('成功する', () async {
      SignInInteractor interactor = SignInInteractor(
        MockSignInSuccessRepository(),
      );

      SignInRequest request = SignInRequest(
        'mock12@email.com', 'mock12Password'
      );

      expect(
        SignInResponse(
          user: User(
            id: 1,
            name: 'Mock User',
          ),
        ),
        await interactor.invoke(request),
      );
    });

    test('失敗する', () async {
      SignInInteractor interactor = SignInInteractor(
        MockSignInFailRepository(),
      );

      SignInRequest request =
        SignInRequest('mock12@email.com', 'mock12Password');

      expect(
        SignInResponse(
          user: null,
        ),
        await interactor.invoke(request),
      );
    });
  });
}
