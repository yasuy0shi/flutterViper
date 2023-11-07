import 'package:flutterViper/entities/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retrieve_response.freezed.dart';

/// サインイン状態を復帰させるレスポンスパラメタのDTO
@freezed
abstract class RetrieveResponse with _$RetrieveResponse {
  factory RetrieveResponse({
    User? user,
  }) = _RetrieveResponse;
}
