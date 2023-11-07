import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/presenters/authentication/authentication_presenter.dart';
import 'package:flutterViper/utils/exceptions/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/interactor_bus.dart';

import '../../mock/interactors/authentication/retrieve_fail_interactor.dart';
import '../../mock/interactors/authentication/retrieve_success_interactor.dart';
import '../../mock/interactors/authentication/sign_in_fail_interactor.dart';
import '../../mock/interactors/authentication/sign_in_success_interactor.dart';
import '../../mock/interactors/authentication/sign_out_fail_interactor.dart';
import '../../mock/interactors/authentication/sign_out_success_interactor.dart';

main() {
  group('Unit: 認証Presenter', () {
    AuthenticationPresenter authenticationPresenter;

    group('サインインする', () {
      test('サインインに成功する', () async {
        InteractorBus bus = InteractorBus()
          ..register<SignInRequest>(SignInSuccessInteractor());

        authenticationPresenter = AuthenticationPresenter(bus);

        await authenticationPresenter.signIn(
          'valid@email.com',
          'validPassword',
        );

        expect(
          User(id: 1, name: 'userName1'),
          authenticationPresenter.state.user,
        );
      });

      test('サインインに失敗する', () async {
        InteractorBus bus = InteractorBus()
          ..register<SignInRequest>(SignInFailInteractor());

        authenticationPresenter = AuthenticationPresenter(bus);

        expect(() => authenticationPresenter.signIn(
          'invalid@email.com',
          'invalidPassword',
        ), throwsA(const TypeMatcher<DataHandlingException>()));
      });
    });

    group('サインイン状態を復帰させる', () {
      test('サインイン状態復帰に成功する', () async {
        InteractorBus bus = InteractorBus()
          ..register<RetrieveRequest>(RetrieveSuccessInteractor());

        authenticationPresenter = AuthenticationPresenter(bus);

        await authenticationPresenter.retrieve();

        expect(
          User(id: 1, name: 'userName1'),
          authenticationPresenter.state.user,
        );
      });

      test('サインイン状態復帰に失敗する', () async {
        InteractorBus bus = InteractorBus()
          ..register<RetrieveRequest>(RetrieveFailInteractor());

        authenticationPresenter = AuthenticationPresenter(bus);

        expect(
          () => authenticationPresenter.retrieve(),
          throwsA(const TypeMatcher<DataHandlingException>()),
        );
      });
    });

    group('サインアウトする', () {
      test('サインアウトに成功する', () async {
        InteractorBus bus = InteractorBus()
          ..register<SignOutRequest>(SignOutSuccessInteractor());

        authenticationPresenter = AuthenticationPresenter(bus);

        await authenticationPresenter.signOut();

        expect(
          null,
          authenticationPresenter.state.user,
        );
      });

      test('サインアウトに失敗する', () async {
        InteractorBus bus = InteractorBus()
          ..register<SignOutRequest>(SignOutFailInteractor());

        authenticationPresenter = AuthenticationPresenter(bus);

        expect(
          () => authenticationPresenter.signOut(),
          throwsA(const TypeMatcher<DataHandlingException>()),
        );
      });
    });
  });
}
