import 'package:flutterViper/entities/user/user.dart';
import 'package:flutterViper/infra/gateways/authentication/i_authentication_repository.dart';

/// サインアウトが成功する認証リポジトリのモッククラス
class MockSignOutSuccessRepository implements IAuthenticationRepository {
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
    throw UnimplementedError('呼び出される想定ではないが呼び出された');
  }

  @override
  Future<void> signOut() async {
    return;
  }
}
