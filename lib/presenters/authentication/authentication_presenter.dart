import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutterViper/entities/authentication/authentication.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_request.dart';
import 'package:flutterViper/interactors/dto/authentication/retrieve_response.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_request.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_in_response.dart';
import 'package:flutterViper/interactors/dto/authentication/sign_out_request.dart';
import 'package:flutterViper/interactors/interactor_bus.dart';
import 'package:flutterViper/utils/provider.dart';
import 'package:flutterViper/utils/exceptions/exceptions.dart';

class AuthenticationPresenterProvider {
  AuthenticationPresenterProvider._();

  static final presenter = StateNotifierProvider<AuthenticationPresenter, Authentication>((ref) {
    return AuthenticationPresenter(ref.read(interactorBusProvider));
  });
}

class AuthenticationPresenter extends StateNotifier<Authentication> {
  final InteractorBus _bus;

  AuthenticationPresenter(this._bus) : super(Authentication(user: null));

  /// サインインを行う
  ///
  /// [email]と[password]からサインインを要求する。
  Future<void> signIn(String email, String password) async {
    try {
      SignInResponse response =
          await _bus.handle(SignInRequest(email, password));

      state = state.copyWith(
        user: response.user,
      );
    } catch (e) {
      throw DataHandlingException(message: 'サインインに失敗しました');
    }
  }

  /// ユーザのサインイン状態を復帰させる
  ///
  /// 自身にトークンが保存されている場合、トークンのリフレッシュを試みる
  /// 成功した場合は正しいサインイン情報が維持されているものとして、ステータスを更新する
  /// 更新時に最新のユーザの情報を取得する
  Future<void> retrieve() async {
    try {
      RetrieveResponse response = await _bus.handle(RetrieveRequest());

      state = state.copyWith(
        user: response.user,
      );
    } catch (e) {
      throw DataHandlingException(message: 'サインイン状態の復元に失敗しました');
    }
  }

  /// サインアウトする
  ///
  /// 現在サインインしているユーザからサインアウトする
  /// トークン関連の情報と、現在選択しているプロジェクト、ユーザIDを端末から消去する
  Future<void> signOut() async {
    try {
      await _bus.handle(SignOutRequest());

      state = Authentication(
        user: null,
      );
    } catch (e) {
      throw DataHandlingException(message: 'サインアウトに失敗しました');
    }
  }
}
