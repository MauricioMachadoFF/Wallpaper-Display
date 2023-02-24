import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:wallpaper_display/core/failures.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';
import 'package:wallpaper_display/features/image_listing/domain/repository/images_listing_repository.dart';

abstract class GetImagesListing {
  Future<Either<Failure, List<ImageCard>>> call();
}

@Injectable(as: GetImagesListing)
class GetImagesListingImpl implements GetImagesListing {
  final ImagesListingRepository repository;

  const GetImagesListingImpl({required this.repository});

  @override
  Future<Either<Failure, List<ImageCard>>> call() async {
    return await repository.getImages();
  }
}
