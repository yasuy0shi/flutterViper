// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_out_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignOutResponse {
  bool get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignOutResponseCopyWith<SignOutResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignOutResponseCopyWith<$Res> {
  factory $SignOutResponseCopyWith(
          SignOutResponse value, $Res Function(SignOutResponse) then) =
      _$SignOutResponseCopyWithImpl<$Res, SignOutResponse>;
  @useResult
  $Res call({bool result});
}

/// @nodoc
class _$SignOutResponseCopyWithImpl<$Res, $Val extends SignOutResponse>
    implements $SignOutResponseCopyWith<$Res> {
  _$SignOutResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignOutResponseImplCopyWith<$Res>
    implements $SignOutResponseCopyWith<$Res> {
  factory _$$SignOutResponseImplCopyWith(_$SignOutResponseImpl value,
          $Res Function(_$SignOutResponseImpl) then) =
      __$$SignOutResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool result});
}

/// @nodoc
class __$$SignOutResponseImplCopyWithImpl<$Res>
    extends _$SignOutResponseCopyWithImpl<$Res, _$SignOutResponseImpl>
    implements _$$SignOutResponseImplCopyWith<$Res> {
  __$$SignOutResponseImplCopyWithImpl(
      _$SignOutResponseImpl _value, $Res Function(_$SignOutResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$SignOutResponseImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignOutResponseImpl implements _SignOutResponse {
  _$SignOutResponseImpl({required this.result});

  @override
  final bool result;

  @override
  String toString() {
    return 'SignOutResponse(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignOutResponseImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignOutResponseImplCopyWith<_$SignOutResponseImpl> get copyWith =>
      __$$SignOutResponseImplCopyWithImpl<_$SignOutResponseImpl>(
          this, _$identity);
}

abstract class _SignOutResponse implements SignOutResponse {
  factory _SignOutResponse({required final bool result}) =
      _$SignOutResponseImpl;

  @override
  bool get result;
  @override
  @JsonKey(ignore: true)
  _$$SignOutResponseImplCopyWith<_$SignOutResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
