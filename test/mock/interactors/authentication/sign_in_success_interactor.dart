import 'package:flutterViper/interactors/authentication/i_sign_in_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_response.dart';
import 'package:flutterViper/entities/user/user.dart';

/// サインインが成功するユースケースを実現するInteractor
class SignInSuccessInteractor implements ISignInUseCase {
  /// {@inheritDoc}
  @override
  Future<SignInResponse> invoke(SignInRequest request) async {
    User user = User(
      id: 1,
      name: 'userName1',
    );

    return SignInResponse(user: user);
  }
}
