import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/category.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';
import 'package:wallpaper_display/features/image_listing/domain/usecases/get_images_listing.dart';

part 'images_listing_cubit.freezed.dart';
part 'images_listing_state.dart';

class ImagesListingCubit extends Cubit<ImagesListingState> {
  final GetImagesListing _getImagesListing;
  ImagesListingCubit({
    required GetImagesListing getImagesListing,
  })  : _getImagesListing = getImagesListing,
        super(
          const ImagesListingState.initial(),
        );

  Future<void> getImagesCards() async {
    emit(const ImagesListingState.loading());
    final imageCardsOrFailure = await _getImagesListing.call();
    emit(
      imageCardsOrFailure.fold(
        (_) => const ImagesListingState.error(),
        (cards) {
          final animalImages = cards
              .where((image) => image.category == ImageCategory.animal)
              .toList();
          final foodImages = cards
              .where((image) => image.category == ImageCategory.food)
              .toList();
          final natureImages = cards
              .where((image) => image.category == ImageCategory.nature)
              .toList();
          final otherImages = cards
              .where((image) => image.category == ImageCategory.other)
              .toList();
          print(animalImages);
          print(foodImages);
          print(natureImages);
          print(otherImages);
          return ImagesListingState.sucess([
            animalImages,
            foodImages,
            natureImages,
            otherImages,
          ]);
        },
      ),
    );
  }
}


// animal("Animais"),
//   nature("Natureza"),
//   food("Comida"),
//   other("Outros");