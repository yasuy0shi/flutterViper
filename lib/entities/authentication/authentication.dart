import 'package:flutterViper/entities/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication.freezed.dart';

@freezed
abstract class Authentication with _$Authentication {
  const Authentication._();

  factory Authentication({
    User? user,
  }) = _Authentication;

  bool get isSignedIn {
    if (user != null) {
      return true;
    }
    return false;
  }
}
