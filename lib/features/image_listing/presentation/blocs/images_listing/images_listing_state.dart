part of 'images_listing_cubit.dart';

@freezed
class ImagesListingState with _$ImagesListingState {
  const factory ImagesListingState.error() = _Error;
  const factory ImagesListingState.loading() = _Loading;
  const factory ImagesListingState.initial() = _Initial;
  const factory ImagesListingState.sucess(List<List<ImageCard>> cards) =
      _Sucess;
}
