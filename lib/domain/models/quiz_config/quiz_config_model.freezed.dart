// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuizConfig {
  String get category => throw _privateConstructorUsedError;
  NumQuestionsEnum get numQuestions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizConfigCopyWith<QuizConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizConfigCopyWith<$Res> {
  factory $QuizConfigCopyWith(
          QuizConfig value, $Res Function(QuizConfig) then) =
      _$QuizConfigCopyWithImpl<$Res, QuizConfig>;
  @useResult
  $Res call({String category, NumQuestionsEnum numQuestions});
}

/// @nodoc
class _$QuizConfigCopyWithImpl<$Res, $Val extends QuizConfig>
    implements $QuizConfigCopyWith<$Res> {
  _$QuizConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? numQuestions = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      numQuestions: null == numQuestions
          ? _value.numQuestions
          : numQuestions // ignore: cast_nullable_to_non_nullable
              as NumQuestionsEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizConfigCopyWith<$Res>
    implements $QuizConfigCopyWith<$Res> {
  factory _$$_QuizConfigCopyWith(
          _$_QuizConfig value, $Res Function(_$_QuizConfig) then) =
      __$$_QuizConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, NumQuestionsEnum numQuestions});
}

/// @nodoc
class __$$_QuizConfigCopyWithImpl<$Res>
    extends _$QuizConfigCopyWithImpl<$Res, _$_QuizConfig>
    implements _$$_QuizConfigCopyWith<$Res> {
  __$$_QuizConfigCopyWithImpl(
      _$_QuizConfig _value, $Res Function(_$_QuizConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? numQuestions = null,
  }) {
    return _then(_$_QuizConfig(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      numQuestions: null == numQuestions
          ? _value.numQuestions
          : numQuestions // ignore: cast_nullable_to_non_nullable
              as NumQuestionsEnum,
    ));
  }
}

/// @nodoc

class _$_QuizConfig implements _QuizConfig {
  _$_QuizConfig({required this.category, required this.numQuestions});

  @override
  final String category;
  @override
  final NumQuestionsEnum numQuestions;

  @override
  String toString() {
    return 'QuizConfig(category: $category, numQuestions: $numQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizConfig &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.numQuestions, numQuestions) ||
                other.numQuestions == numQuestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, numQuestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizConfigCopyWith<_$_QuizConfig> get copyWith =>
      __$$_QuizConfigCopyWithImpl<_$_QuizConfig>(this, _$identity);
}

abstract class _QuizConfig implements QuizConfig {
  factory _QuizConfig(
      {required final String category,
      required final NumQuestionsEnum numQuestions}) = _$_QuizConfig;

  @override
  String get category;
  @override
  NumQuestionsEnum get numQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_QuizConfigCopyWith<_$_QuizConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
