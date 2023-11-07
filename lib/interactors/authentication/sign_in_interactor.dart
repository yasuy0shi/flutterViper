import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/infra/gateways/authentication/i_authentication_repository.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_response.dart';

import 'i_sign_in_use_case.dart';

/// サインインを行うInteractorクラス
class SignInInteractor implements ISignInUseCase {
  IAuthenticationRepository authenticationRepository;

  /// コンストラクタ
  SignInInteractor(
    this.authenticationRepository,
  );

  /// {@inheritDoc}
  @override
  Future<SignInResponse> invoke(SignInRequest request) async {
    try {
      // サインインを行う
      User user = await authenticationRepository.signIn(
        email: request.email,
        password: request.password,
      );

      return SignInResponse(
        user: user,
      );
    } catch (e) {
      return SignInResponse(
        user: null
      );
    }
  }
}
