import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/interactors/authentication/i_retrieve_use_case.dart';
import 'package:flutterViper/interactors/authentication/i_sign_in_use_case.dart';
import 'package:flutterViper/interactors/authentication/i_sign_out_use_case.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_response.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_response.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_response.dart';
import 'package:flutterViper/interactors/interactor_bus.dart';
import 'package:flutterViper/utils/exceptions/exceptions.dart';

/// ローカル環境における動作確認の為の一時的なInteractorBusビルダ
// TODO: API疎通後、本クラスを削除する
class InteractorBusBuilder {
  /// InteractorBusを作成する
  static InteractorBus build() {
    return InteractorBus()
      ..register<SignInRequest>(SignInSuccessInteractor())
      ..register<RetrieveRequest>(RetrieveFailInteractor())
      ..register<SignOutRequest>(SignOutSuccessInteractor());
  }
}

/// サインインが成功するユースケースを実現するInteractor
class SignInSuccessInteractor implements ISignInUseCase {
  /// {@inheritDoc}
  @override
  Future<SignInResponse> invoke(SignInRequest request) async {
    if (request.email != "hoge@example.com" || request.password != "hoge") {
      throw AuthenticationException(message: "サインインに失敗しました");
    }

    User user = User(
      id: 1,
      name: 'Hoge',
    );

    return SignInResponse(
      user: user
    );
  }
}

/// サインイン状態の復帰に失敗するユースケースを実現するInteractor
class RetrieveFailInteractor implements IRetrieveUseCase {
  @override
  Future<RetrieveResponse> invoke(RetrieveRequest request) async {
    throw AuthenticationException(message: "サインイン状態の復帰に失敗しました");
  }
}

/// サインアウトが成功するユースケースを実現するInteractor
class SignOutSuccessInteractor implements ISignOutUseCase {
  /// {@inheritDoc}
  @override
  Future<SignOutResponse> invoke(SignOutRequest request) async {
    return SignOutResponse(result: true);
  }
}
