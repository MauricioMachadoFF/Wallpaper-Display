import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_display/core/injection.dart';
import 'package:wallpaper_display/core/route/router.dart';
import 'package:wallpaper_display/core/route/routes.dart';

void main() {
  configureDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallpaper Display',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Routes.login,
        onGenerateRoute: WPRouter.routeFromSettings,
      ),
    );
  }
}
