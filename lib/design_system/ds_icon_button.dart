import 'package:flutter/material.dart';
import 'package:wallpaper_display/design_system/colors.dart';

class DSIconButton extends StatefulWidget {
  const DSIconButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final Icon icon;
  final VoidCallback onTap;

  @override
  State<DSIconButton> createState() => _DSIconButtonState();
}

class _DSIconButtonState extends State<DSIconButton> {
  bool _isHovered = false;

  Color get _backgroundColor => _isHovered ? darkGrey : whiteGrey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      onTap: widget.onTap,
      onFocusChange: (value) => setState(() {
        _isHovered = value;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(64),
        ),
        child: IconButton(
          icon: widget.icon,
          onPressed: widget.onTap,
          color: _isHovered ? white : black,
          iconSize: 32,
        ),
      ),
    );
  }
}
