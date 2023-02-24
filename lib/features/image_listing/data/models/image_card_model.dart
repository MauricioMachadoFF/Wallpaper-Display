import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_card_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageCardModel {
  final String category;
  final String title;
  final String imageUrl;

  factory ImageCardModel.fromJson(Map<String, dynamic> json) =>
      _$ImageCardModelFromJson(json);

  ImageCardModel({
    required this.category,
    required this.title,
    required this.imageUrl,
  });
}
