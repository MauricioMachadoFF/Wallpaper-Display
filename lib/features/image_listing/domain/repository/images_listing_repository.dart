import 'package:dartz/dartz.dart';
import 'package:wallpaper_display/core/failures.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';

abstract class ImagesListingRepository {
  Future<Either<Failure, List<ImageCard>>> getImages();
}
