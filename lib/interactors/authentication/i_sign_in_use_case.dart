import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_response.dart';

/// サインインを行うインターフェース
///
/// Dart言語は `implicit interface（暗黙的インターフェース）` であるため明示的に宣言する
abstract class ISignInUseCase {
  Future<SignInResponse> invoke(SignInRequest request);
}
