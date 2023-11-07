import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_response.dart';

/// サインイン状態を復帰させるユースケースのインターフェース
///
/// Dart言語は `implicit interface（暗黙的インターフェース）` であるため明示的に宣言する
abstract class IRetrieveUseCase {
  Future<RetrieveResponse> invoke(RetrieveRequest request);
}
