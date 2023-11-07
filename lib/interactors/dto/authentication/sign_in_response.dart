import 'package:flutterViper/entities/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.freezed.dart';

/// サインインを行うレスポンスパラメタのDTO
@freezed
abstract class SignInResponse with _$SignInResponse {
  factory SignInResponse({
    User? user,
  }) = _SignInResponse;
}
