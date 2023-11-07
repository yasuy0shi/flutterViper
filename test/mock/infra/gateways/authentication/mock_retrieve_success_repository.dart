import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/infra/gateways/authentication/i_authentication_repository.dart';

/// サインイン状態の復帰が成功する認証リポジトリのモッククラス
class MockRetrieveSuccessRepository implements IAuthenticationRepository {
  /// {@inheritDoc}
  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError('呼び出される想定ではないが呼び出された');
  }

  @override
  Future<User> retrieve() async {
    return User(
      id: 1,
      name: 'Mock User',
    );
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError('呼び出される想定ではないが呼び出された');
  }
}
