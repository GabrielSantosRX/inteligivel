import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class Category with _$Category {
  const Category._();

  const factory Category({
    String? id,
    required String category,
    required String image,
    required String description,
    required String subject,
    required int level,
    required List<int> rate,
  }) = _category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
        category: map['category'] ?? '',
        image: map['image'] ?? '',
        description: map['description'] ?? '',
        subject: map['subject'] ?? '',
        level: map['level'] ?? 1,
        rate: List<int>.from(map['rate'] ?? []));
  }

  factory Category.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return Category.fromMap(data).copyWith(id: doc.id);
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
