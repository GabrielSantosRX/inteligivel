// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_question _$$_questionFromJson(Map<String, dynamic> json) => _$_question(
      id: json['id'] as String?,
      level: json['level'] as int,
      category: json['category'] as String,
      image: json['image'] as String,
      question: json['question'] as String,
      subject: json['subject'] as String,
      correctAnswer: json['correctAnswer'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_questionToJson(_$_question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'category': instance.category,
      'image': instance.image,
      'question': instance.question,
      'subject': instance.subject,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };
