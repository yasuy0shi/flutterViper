import 'package:flutterViper/interactors/authentication/i_sign_out_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_response.dart';
import 'package:flutterViper/utils/exceptions/exceptions.dart';

/// サインアウトが失敗するユースケースを実現するInteractor
class SignOutFailInteractor implements ISignOutUseCase {
  /// {@inheritDoc}
  @override
  Future<SignOutResponse> invoke(SignOutRequest request) async {
    throw AuthenticationException(message: 'サインアウトに失敗しました');
  }
}
