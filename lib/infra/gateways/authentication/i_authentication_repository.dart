import 'package:flutterViper/entities/user/user.dart';

/// 認証リポジトリのインターフェース
///
/// Dart言語は `implicit interface（暗黙的インターフェース）` であるため明示的に宣言する
abstract class IAuthenticationRepository {
  /// サインインを行う
  Future<User> signIn({
    required String email,
    required String password,
  });

  /// サインイン状態の復帰を行う
  Future<User> retrieve();

  /// サインアウトを行う
  Future<void> signOut();
}
