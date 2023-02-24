import 'package:flutter/material.dart';
import 'package:wallpaper_display/core/route/routes.dart';
import 'package:wallpaper_display/features/image_listing/domain/entities/image_card.dart';

class ImageCardWidget extends StatefulWidget {
  const ImageCardWidget({
    super.key,
    required this.onSelectCard,
    required this.card,
  });

  final ImageCard card;
  final VoidCallback onSelectCard;

  @override
  State<ImageCardWidget> createState() => _ImageCardWidgetState();
}

class _ImageCardWidgetState extends State<ImageCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        Routes.singleImage,
        arguments: widget.card,
      ),
      onFocusChange: (value) {
        widget.onSelectCard();
        setState(() {
          _isHovered = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 128,
        width: 194,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: _isHovered ? Colors.white : Colors.transparent,
            width: _isHovered ? 4 : 2,
          ),
          image: DecorationImage(
            image: NetworkImage(
              widget.card.imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
