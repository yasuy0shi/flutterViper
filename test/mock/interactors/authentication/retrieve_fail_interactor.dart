import 'package:flutterViper/interactors/authentication/i_retrieve_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_response.dart';
import 'package:flutterViper/utils/exceptions/exceptions.dart';

/// サインイン状態の復帰に失敗するユースケースを実現するInteractor
class RetrieveFailInteractor implements IRetrieveUseCase {
  /// {@inheritDoc}
  @override
  Future<RetrieveResponse> invoke(RetrieveRequest request) async {
    throw AuthenticationException(message: 'サインイン状態の復帰に失敗しました');
  }
}
