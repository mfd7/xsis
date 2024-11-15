// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
          AppFailure value, $Res Function(AppFailure) then) =
      _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GeneralImplCopyWith<$Res> {
  factory _$$GeneralImplCopyWith(
          _$GeneralImpl value, $Res Function(_$GeneralImpl) then) =
      __$$GeneralImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GeneralImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$GeneralImpl>
    implements _$$GeneralImplCopyWith<$Res> {
  __$$GeneralImplCopyWithImpl(
      _$GeneralImpl _value, $Res Function(_$GeneralImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GeneralImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeneralImpl implements General {
  const _$GeneralImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.general(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralImplCopyWith<_$GeneralImpl> get copyWith =>
      __$$GeneralImplCopyWithImpl<_$GeneralImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) {
    return general(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) {
    return general?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) {
    return general?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class General implements AppFailure {
  const factory General(final String message) = _$GeneralImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$GeneralImplCopyWith<_$GeneralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationImplCopyWith<$Res> {
  factory _$$ValidationImplCopyWith(
          _$ValidationImpl value, $Res Function(_$ValidationImpl) then) =
      __$$ValidationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Map<String, String> errors});
}

/// @nodoc
class __$$ValidationImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ValidationImpl>
    implements _$$ValidationImplCopyWith<$Res> {
  __$$ValidationImplCopyWithImpl(
      _$ValidationImpl _value, $Res Function(_$ValidationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errors = null,
  }) {
    return _then(_$ValidationImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$ValidationImpl implements Validation {
  const _$ValidationImpl(this.message,
      [final Map<String, String> errors = const {}])
      : _errors = errors;

  @override
  final String message;
  final Map<String, String> _errors;
  @override
  @JsonKey()
  Map<String, String> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'AppFailure.validation(message: $message, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationImplCopyWith<_$ValidationImpl> get copyWith =>
      __$$ValidationImplCopyWithImpl<_$ValidationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) {
    return validation(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) {
    return validation?.call(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class Validation implements AppFailure {
  const factory Validation(final String message,
      [final Map<String, String> errors]) = _$ValidationImpl;

  String get message;
  Map<String, String> get errors;
  @JsonKey(ignore: true)
  _$$ValidationImplCopyWith<_$ValidationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParsingDataImplCopyWith<$Res> {
  factory _$$ParsingDataImplCopyWith(
          _$ParsingDataImpl value, $Res Function(_$ParsingDataImpl) then) =
      __$$ParsingDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ParsingDataImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ParsingDataImpl>
    implements _$$ParsingDataImplCopyWith<$Res> {
  __$$ParsingDataImplCopyWithImpl(
      _$ParsingDataImpl _value, $Res Function(_$ParsingDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ParsingDataImpl implements ParsingData {
  const _$ParsingDataImpl();

  @override
  String toString() {
    return 'AppFailure.parsingData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ParsingDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) general,
    required TResult Function(String message, Map<String, String> errors)
        validation,
    required TResult Function() parsingData,
  }) {
    return parsingData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? general,
    TResult? Function(String message, Map<String, String> errors)? validation,
    TResult? Function()? parsingData,
  }) {
    return parsingData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? general,
    TResult Function(String message, Map<String, String> errors)? validation,
    TResult Function()? parsingData,
    required TResult orElse(),
  }) {
    if (parsingData != null) {
      return parsingData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(General value) general,
    required TResult Function(Validation value) validation,
    required TResult Function(ParsingData value) parsingData,
  }) {
    return parsingData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(General value)? general,
    TResult? Function(Validation value)? validation,
    TResult? Function(ParsingData value)? parsingData,
  }) {
    return parsingData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(General value)? general,
    TResult Function(Validation value)? validation,
    TResult Function(ParsingData value)? parsingData,
    required TResult orElse(),
  }) {
    if (parsingData != null) {
      return parsingData(this);
    }
    return orElse();
  }
}

abstract class ParsingData implements AppFailure {
  const factory ParsingData() = _$ParsingDataImpl;
}
