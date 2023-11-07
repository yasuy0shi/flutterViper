import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_response.dart';

/// サインアウトを行うインターフェース
///
/// Dart言語は `implicit interface（暗黙的インターフェース）` であるため明示的に宣言する
abstract class ISignOutUseCase {
  Future<SignOutResponse> invoke(SignOutRequest request);
}
