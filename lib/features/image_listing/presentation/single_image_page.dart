import 'package:flutter/material.dart';
import 'package:wallpaper_display/design_system/design_system.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';

class SingleImagePage extends StatelessWidget {
  const SingleImagePage(this.card, {super.key});

  final ImageCard card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(card.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: DSIconButton(
                    onTap: Navigator.of(context).pop,
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromRGBO(255, 255, 255, 0.6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                child: Text(
                  card.title,
                  style: const TextStyle(
                    fontSize: 40,
                    color: black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
