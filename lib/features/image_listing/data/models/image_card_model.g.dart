// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageCardModel _$ImageCardModelFromJson(Map<String, dynamic> json) =>
    ImageCardModel(
      category: json['category'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$ImageCardModelToJson(ImageCardModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'image_url': instance.imageUrl,
    };
