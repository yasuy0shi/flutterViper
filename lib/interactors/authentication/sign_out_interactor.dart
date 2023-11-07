import 'package:flutterViper/infra/gateways/authentication/i_authentication_repository.dart';
import 'package:flutterViper/interactors/authentication/i_sign_out_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_response.dart';


/// サインアウトを行うInteractorクラス
class SignOutInteractor implements ISignOutUseCase {
  IAuthenticationRepository authenticationRepository;

  /// コンストラクタ
  SignOutInteractor(
    this.authenticationRepository,
  );

  /// {@inheritDoc}
  @override
  Future<SignOutResponse> invoke(SignOutRequest request) async {
    try {
      // サインアウトを行う
      await authenticationRepository.signOut();

      return SignOutResponse(
        result: true,
      );
    } catch (e) {
      return SignOutResponse(
        result: false
      );
    }
  }
}
