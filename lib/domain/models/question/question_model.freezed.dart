// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String? get id => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get correctAnswer => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String? id,
      int level,
      String category,
      String image,
      String question,
      String subject,
      String correctAnswer,
      List<String> answers});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = null,
    Object? category = null,
    Object? image = null,
    Object? question = null,
    Object? subject = null,
    Object? correctAnswer = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_questionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_questionCopyWith(
          _$_question value, $Res Function(_$_question) then) =
      __$$_questionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int level,
      String category,
      String image,
      String question,
      String subject,
      String correctAnswer,
      List<String> answers});
}

/// @nodoc
class __$$_questionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_question>
    implements _$$_questionCopyWith<$Res> {
  __$$_questionCopyWithImpl(
      _$_question _value, $Res Function(_$_question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = null,
    Object? category = null,
    Object? image = null,
    Object? question = null,
    Object? subject = null,
    Object? correctAnswer = null,
    Object? answers = null,
  }) {
    return _then(_$_question(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_question extends _question with DiagnosticableTreeMixin {
  const _$_question(
      {this.id,
      required this.level,
      required this.category,
      required this.image,
      required this.question,
      required this.subject,
      required this.correctAnswer,
      required final List<String> answers})
      : _answers = answers,
        super._();

  factory _$_question.fromJson(Map<String, dynamic> json) =>
      _$$_questionFromJson(json);

  @override
  final String? id;
  @override
  final int level;
  @override
  final String category;
  @override
  final String image;
  @override
  final String question;
  @override
  final String subject;
  @override
  final String correctAnswer;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Question(id: $id, level: $level, category: $category, image: $image, question: $question, subject: $subject, correctAnswer: $correctAnswer, answers: $answers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Question'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('correctAnswer', correctAnswer))
      ..add(DiagnosticsProperty('answers', answers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      level,
      category,
      image,
      question,
      subject,
      correctAnswer,
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_questionCopyWith<_$_question> get copyWith =>
      __$$_questionCopyWithImpl<_$_question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_questionToJson(
      this,
    );
  }
}

abstract class _question extends Question {
  const factory _question(
      {final String? id,
      required final int level,
      required final String category,
      required final String image,
      required final String question,
      required final String subject,
      required final String correctAnswer,
      required final List<String> answers}) = _$_question;
  const _question._() : super._();

  factory _question.fromJson(Map<String, dynamic> json) = _$_question.fromJson;

  @override
  String? get id;
  @override
  int get level;
  @override
  String get category;
  @override
  String get image;
  @override
  String get question;
  @override
  String get subject;
  @override
  String get correctAnswer;
  @override
  List<String> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_questionCopyWith<_$_question> get copyWith =>
      throw _privateConstructorUsedError;
}
