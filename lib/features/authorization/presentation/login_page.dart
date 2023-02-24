import 'package:flutter/material.dart';
import 'package:wallpaper_display/core/route/routes.dart';
import 'package:wallpaper_display/design_system/design_system.dart';
import 'package:wallpaper_display/features/authorization/presentation/widgets/login_image_carroussel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepBlue,
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
                  Container(
                    height: 64,
                    width: 64,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    'Seja bem-vindo!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Por favor insira suas informações de acesso.',
                    style: TextStyle(
                      fontSize: 14,
                      color: white,
                    ),
                  ),
                  const DSDivider(),
                  SizedBox(
                    width: double.maxFinite,
                    child: DSButton(
                      label: 'Entrar',
                      onTap: () => Navigator.of(context).pushReplacementNamed(
                        Routes.imagesList,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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

class DSDivider extends StatelessWidget {
  const DSDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(
          color: white,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
