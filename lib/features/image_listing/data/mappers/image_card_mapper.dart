import 'package:wallpaper_display/features/image_listing/data/models/image_card_model.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/category.dart';

import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';

abstract class ImageCardMapper {
  static ImageCard toEntity({required ImageCardModel model}) {
    final ImageCategory imageCategory = _mapCategory(model.category);
    return ImageCard(
      category: imageCategory,
      title: model.title,
      imageUrl: model.imageUrl,
    );
  }
}

ImageCategory _mapCategory(String category) {
  late final ImageCategory result;
  switch (category) {
    case "Food":
      result = ImageCategory.food;
      break;
    case "Animals":
      result = ImageCategory.animal;
      break;
    case "Nature":
      result = ImageCategory.nature;
      break;
    default:
      result = ImageCategory.other;
  }
  return result;
}
