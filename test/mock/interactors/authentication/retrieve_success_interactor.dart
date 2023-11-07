import 'package:flutterViper/interactors/authentication/i_retrieve_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_response.dart';
import 'package:flutterViper/entities/user/user.dart';

/// サインイン状態の復帰が成功するユースケースを実現するInteractor
class RetrieveSuccessInteractor implements IRetrieveUseCase {
  /// {@inheritDoc}
  @override
  Future<RetrieveResponse> invoke(RetrieveRequest request) async {
    User user = User(
      id: 1,
      name: 'userName1',
    );

    return RetrieveResponse(user: user);
  }
}
