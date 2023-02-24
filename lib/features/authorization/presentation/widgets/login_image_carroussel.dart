import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallpaper_display/design_system/colors.dart';

class LoginImageCarroussel extends StatefulWidget {
  const LoginImageCarroussel({super.key});

  @override
  State<LoginImageCarroussel> createState() => _LoginImageCarrousselState();
}

class _LoginImageCarrousselState extends State<LoginImageCarroussel> {
  int _pos = 0;
  bool _visible = true;
  late final Timer _timer;

  final String _basePath = "assets/images/login_image_";
  List<String> get _imagePaths =>
      ["${_basePath}1.jpg", "${_basePath}2.jpg", "${_basePath}3.jpg"];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) async {
        int newPos = _pos + 1;
        if (newPos > (_imagePaths.length - 1)) {
          newPos = 0;
        }
        setState(() {
          _visible = !_visible;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _pos = newPos;
          _visible = !_visible;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1 : 0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              _imagePaths[_pos],
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(80, 0, 0, 0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: deepBlue,
                  ),
                  child: const Text(
                    "Transforme sua televisão em uma nova peça de decoração para sua casa. Use da nossa mais vasta coleção de imagens para tornar a sua televisão ainda mais útil e luxuosa",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
