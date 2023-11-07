import 'package:flutterViper/interactors/authentication/i_sign_out_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_response.dart';

/// サインアウトが成功するユースケースを実現するInteractor
class SignOutSuccessInteractor implements ISignOutUseCase {
  /// {@inheritDoc}
  @override
  Future<SignOutResponse> invoke(SignOutRequest request) async {
    return SignOutResponse(result: true);
  }
}
