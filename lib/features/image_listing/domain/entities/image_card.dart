import 'package:equatable/equatable.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/category.dart';

class ImageCard extends Equatable {
  const ImageCard({
    required this.category,
    required this.title,
    required this.imageUrl,
  });

  final ImageCategory category;
  final String title;
  final String imageUrl;

  @override
  List get props => [category, title, imageUrl];
}
