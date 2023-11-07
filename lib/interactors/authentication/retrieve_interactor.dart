import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/infra/gateways/authentication/i_authentication_repository.dart';
import 'package:flutterViper/interactors/authentication/i_retrieve_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_response.dart';

/// サインイン状態の復帰を行うInteractorクラス
class RetrieveInteractor implements IRetrieveUseCase {
  IAuthenticationRepository authenticationRepository;

  /// コンストラクタ
  RetrieveInteractor(
    this.authenticationRepository,
  );

  /// {@inheritDoc}
  @override
  Future<RetrieveResponse> invoke(RetrieveRequest request) async {
    try {
      User user = await authenticationRepository.retrieve();
      return RetrieveResponse(
        user: user,
      );
    } catch (e) {
      return RetrieveResponse(
        user: null
      );
    }
  }
}
