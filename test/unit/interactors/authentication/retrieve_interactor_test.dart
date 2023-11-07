import 'package:flutter_test/flutter_test.dart';
import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/interactors/authentication/retrieve_interactor.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_response.dart';

import '../../../mock/infra/gateways/authentication/mock_retrieve_fail_repository.dart';
import '../../../mock/infra/gateways/authentication/mock_retrieve_success_repository.dart';


main() {
  group('Unit: サインイン状態を復帰させるInteractor', () {
    test('成功する', () async {
      RetrieveInteractor interactor = RetrieveInteractor(
        MockRetrieveSuccessRepository(),
      );

      expect(
        RetrieveResponse(
          user: User(
            id: 1,
            name: 'Mock User',
          )
        ),
        await interactor.invoke(RetrieveRequest()),
      );
    });

    test('失敗する', () async {
      RetrieveInteractor interactor = RetrieveInteractor(
        MockRetrieveFailRepository(),
      );

      expect(
        RetrieveResponse(
          user: null,
        ),
        await interactor.invoke(RetrieveRequest())
      );
    });
  });
}
