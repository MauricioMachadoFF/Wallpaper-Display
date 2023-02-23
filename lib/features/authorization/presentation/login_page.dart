import 'package:flutter/material.dart';
import 'package:wallpaper_display/features/authorization/presentation/widgets/login_image_carroussel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Seja bem-vindo!'),
                  const SizedBox(height: 4),
                  const Text('Por favor insira suas informações de acesso.'),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.maxFinite,
                    child: DSButton(
                      label: 'banana',
                      onTap: () {},
                    ),
                  ),
                  const DSDivider(),
                  SizedBox(
                    width: double.maxFinite,
                    child: DSButton(
                      label: 'maça',
                      onTap: () {},
                    ),
                  ),
                  // const TextField(),
                  //TODO(MAURICIO): Create DS token for height and width
                  const SizedBox(height: 16),
                  // const TextField(),
                ],
              ),
            ),
          ),
          const Expanded(
            child: LoginImageCarroussel(),
          ),
        ],
      )),
    );
  }
}

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

  Color get _selectedColor => widget.selectedColor ?? Colors.grey.shade700;
  Color get _unselectedColor => widget.unselectedColor ?? Colors.grey.shade300;

  Color get _backgroundColor => _isHovered ? _selectedColor : _unselectedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      onTap: widget.onTap,
      onFocusChange: (value) => setState(() {
        _isHovered = value;
      }),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class DSDivider extends StatelessWidget {
  const DSDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(
          color: Colors.black,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
