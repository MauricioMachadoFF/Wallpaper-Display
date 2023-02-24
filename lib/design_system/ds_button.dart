import 'package:flutter/material.dart';
import 'package:wallpaper_display/design_system/colors.dart';

class DSButton extends StatefulWidget {
  const DSButton({
    super.key,
    required this.label,
    required this.onTap,
    this.selectedColor,
    this.unselectedColor,
  });

  final String label;
  final VoidCallback onTap;
  final Color? selectedColor;
  final Color? unselectedColor;

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  bool _isHovered = false;

  Color get _selectedColor => widget.selectedColor ?? darkGrey;
  Color get _unselectedColor => widget.unselectedColor ?? whiteGrey;

  Color get _backgroundColor => _isHovered ? _selectedColor : _unselectedColor;

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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered ? white : black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
