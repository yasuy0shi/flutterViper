import 'package:flutterViper/interactors/authentication/sign_out_interactor.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mock/infra/gateways/authentication/mock_sign_out_fail_repository.dart';
import '../../../mock/infra/gateways/authentication/mock_sign_out_success_repository.dart';


main() {
  group('Unit: サインアウトするInteractor', () {
    test('成功する', () async {
      SignOutInteractor interactor = SignOutInteractor(
        MockSignOutSuccessRepository(),
      );

      SignOutRequest request = SignOutRequest();

      expect(
        SignOutResponse(
          result: true,
        ),
        await interactor.invoke(request),
      );
    });

    test('失敗する', () async {
      SignOutInteractor interactor = SignOutInteractor(
        MockSignOutFailRepository(),
      );

      SignOutRequest request = SignOutRequest();

      expect(
        SignOutResponse(
          result: false,
        ),
        await interactor.invoke(request),
      );
    });
  });
}
