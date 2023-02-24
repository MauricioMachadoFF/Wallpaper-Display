// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:wallpaper_display/features/image_listing/data/repository/images_listing_repository_impl.dart'
    as _i4;
import 'package:wallpaper_display/features/image_listing/domain/repository/images_listing_repository.dart'
    as _i3;
import 'package:wallpaper_display/features/image_listing/domain/usecases/get_images_listing.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ImagesListingRepository>(
        () => _i4.ImagesListingRepositoryImpl());
    gh.factory<_i5.GetImagesListing>(() => _i5.GetImagesListingImpl(
        repository: gh<_i3.ImagesListingRepository>()));
    return this;
  }
}
