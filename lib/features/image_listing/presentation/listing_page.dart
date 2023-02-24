import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_display/core/route/routes.dart';
import 'package:wallpaper_display/design_system/design_system.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';
import 'package:wallpaper_display/features/image_listing/presentation/blocs/images_listing/images_listing_cubit.dart';
import 'package:wallpaper_display/features/image_listing/presentation/widgets/image_card.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    super.initState();
    context.read<ImagesListingCubit>().getImagesCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ImagesListingCubit, ImagesListingState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            sucess: (cards) => LoadedListingPage(cards),
          );
        },
      ),
    );
  }
}

class LoadedListingPage extends StatefulWidget {
  const LoadedListingPage(this.cards, {super.key});

  final List<List<ImageCard>> cards;

  @override
  State<LoadedListingPage> createState() => _LoadedListingPageState();
}

class _LoadedListingPageState extends State<LoadedListingPage> {
  String? _imageUrl;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      constraints: const BoxConstraints.expand(),
      decoration: _imageUrl != null
          ? BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    _imageUrl!,
                  ),
                  fit: BoxFit.cover),
            )
          : const BoxDecoration(
              color: deepBlue,
            ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 0, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: DSIconButton(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.login),
                        icon: const Icon(Icons.logout_rounded),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, categoryIndex) {
                      if (widget.cards[categoryIndex].isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              widget.cards[categoryIndex][0].category
                                  .categoryString,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 128,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, cardIndex) =>
                                        ImageCardWidget(
                                      card: widget.cards[categoryIndex]
                                          [cardIndex],
                                      onSelectCard: () => _setBackgroundImage(
                                        widget.cards[categoryIndex][cardIndex]
                                            .imageUrl,
                                      ),
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 16),
                                    itemCount:
                                        widget.cards[categoryIndex].length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                    itemCount: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setBackgroundImage(String imageSelected) {
    setState(() {
      _imageUrl = imageSelected;
    });
  }
}
