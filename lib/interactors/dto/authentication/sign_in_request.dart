/// サインインを行うリクエストパラメタのDTO
class SignInRequest {
  final String email;
  final String password;

  /// コンストラクタ
  SignInRequest(this.email, this.password);
}
