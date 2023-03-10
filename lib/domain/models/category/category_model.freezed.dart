// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String? get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  List<int> get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String? id,
      String category,
      String image,
      String description,
      String subject,
      int level,
      List<int> rate});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? image = null,
    Object? description = null,
    Object? subject = null,
    Object? level = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_categoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_categoryCopyWith(
          _$_category value, $Res Function(_$_category) then) =
      __$$_categoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String category,
      String image,
      String description,
      String subject,
      int level,
      List<int> rate});
}

/// @nodoc
class __$$_categoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_category>
    implements _$$_categoryCopyWith<$Res> {
  __$$_categoryCopyWithImpl(
      _$_category _value, $Res Function(_$_category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = null,
    Object? image = null,
    Object? description = null,
    Object? subject = null,
    Object? level = null,
    Object? rate = null,
  }) {
    return _then(_$_category(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value._rate
          : rate // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_category extends _category with DiagnosticableTreeMixin {
  const _$_category(
      {this.id,
      required this.category,
      required this.image,
      required this.description,
      required this.subject,
      required this.level,
      required final List<int> rate})
      : _rate = rate,
        super._();

  factory _$_category.fromJson(Map<String, dynamic> json) =>
      _$$_categoryFromJson(json);

  @override
  final String? id;
  @override
  final String category;
  @override
  final String image;
  @override
  final String description;
  @override
  final String subject;
  @override
  final int level;
  final List<int> _rate;
  @override
  List<int> get rate {
    if (_rate is EqualUnmodifiableListView) return _rate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rate);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Category(id: $id, category: $category, image: $image, description: $description, subject: $subject, level: $level, rate: $rate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Category'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('subject', subject))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('rate', rate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_category &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(other._rate, _rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, category, image, description,
      subject, level, const DeepCollectionEquality().hash(_rate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_categoryCopyWith<_$_category> get copyWith =>
      __$$_categoryCopyWithImpl<_$_category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_categoryToJson(
      this,
    );
  }
}

abstract class _category extends Category {
  const factory _category(
      {final String? id,
      required final String category,
      required final String image,
      required final String description,
      required final String subject,
      required final int level,
      required final List<int> rate}) = _$_category;
  const _category._() : super._();

  factory _category.fromJson(Map<String, dynamic> json) = _$_category.fromJson;

  @override
  String? get id;
  @override
  String get category;
  @override
  String get image;
  @override
  String get description;
  @override
  String get subject;
  @override
  int get level;
  @override
  List<int> get rate;
  @override
  @JsonKey(ignore: true)
  _$$_categoryCopyWith<_$_category> get copyWith =>
      throw _privateConstructorUsedError;
}
