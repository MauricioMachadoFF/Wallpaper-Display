import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wallpaper_display/features/image_listing/data/mappers/image_card_mapper.dart';
import 'package:wallpaper_display/features/image_listing/data/mocked_data.dart';
import 'package:wallpaper_display/features/image_listing/data/models/image_card_model.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';
import 'package:wallpaper_display/core/failures.dart';
import 'package:wallpaper_display/features/image_listing/domain/repository/images_listing_repository.dart';

@Injectable(as: ImagesListingRepository)
class ImagesListingRepositoryImpl implements ImagesListingRepository {
  @override
  Future<Either<Failure, List<ImageCard>>> getImages() async {
    try {
      final data = mockImagesListing.map(ImageCardModel.fromJson).toList();
      final result = data
          .map((imageModel) => ImageCardMapper.toEntity(model: imageModel))
          .toList();
      return Right(result);
    } catch (_) {
      throw const Left(UnhandledFailure());
    }
  }
}
