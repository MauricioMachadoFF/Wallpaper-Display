import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_display/core/injection.dart';
import 'package:wallpaper_display/core/route/navigator_helper.dart';
import 'package:wallpaper_display/core/route/routes.dart';
import 'package:wallpaper_display/features/authorization/presentation/login_page.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';
import 'package:wallpaper_display/features/image_listing/presentation/blocs/images_listing/images_listing_cubit.dart';
import 'package:wallpaper_display/features/image_listing/presentation/listing_page.dart';
import 'package:wallpaper_display/features/image_listing/presentation/single_image_page.dart';

abstract class WPRouter {
  static Route routeFromSettings(RouteSettings settings) {
    late Widget page;

    switch (settings.name) {
      case Routes.imagesList:
        page = BlocProvider(
          create: (context) =>
              ImagesListingCubit(getImagesListing: getIt.get()),
          child: const ListingPage(),
        );
        break;
      case Routes.singleImage:
        if (settings.arguments == null) {
          throw Exception("Single Image page with params null");
        }
        final card = settings.arguments as ImageCard;
        page = SingleImagePage(card);
        break;
      case Routes.login:
      default:
        page = const LoginPage();
        break;
    }

    return NavigatorHelper.createRoute(page);
  }
}
