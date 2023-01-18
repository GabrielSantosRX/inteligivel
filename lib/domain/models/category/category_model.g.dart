// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_category _$$_categoryFromJson(Map<String, dynamic> json) => _$_category(
      id: json['id'] as String?,
      category: json['category'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      subject: json['subject'] as String,
      level: json['level'] as int,
    );

Map<String, dynamic> _$$_categoryToJson(_$_category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'image': instance.image,
      'description': instance.description,
      'subject': instance.subject,
      'level': instance.level,
    };
