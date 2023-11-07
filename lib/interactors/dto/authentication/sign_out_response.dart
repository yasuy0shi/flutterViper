import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out_response.freezed.dart';

/// サインアウトを行うレスポンスパラメタのDTO
@freezed
abstract class SignOutResponse with _$SignOutResponse {
  factory SignOutResponse({
    required bool result,
  }) = _SignOutResponse;
}
