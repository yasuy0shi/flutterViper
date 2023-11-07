import 'package:flutterViper/interactors/authentication/i_sign_in_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_response.dart';
import 'package:flutterViper/utils/exceptions/exceptions.dart';

/// サインインが失敗するユースケースを実現するInteractor
class SignInFailInteractor implements ISignInUseCase {
  /// {@inheritDoc}
  @override
  Future<SignInResponse> invoke(SignInRequest request) async {
    throw AuthenticationException(message: 'サインインに失敗しました');
  }
}
