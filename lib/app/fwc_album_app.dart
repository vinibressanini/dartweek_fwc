import 'package:dartweek_fwc/app/core/ui/theme/theme_config.dart';
import 'package:dartweek_fwc/app/pages/auth/login/login_page.dart';
import 'package:dartweek_fwc/app/pages/home/home_page.dart';
import 'package:dartweek_fwc/app/pages/splash/splash_route.dart';
import 'package:flutter/material.dart';

import 'pages/splash/splash_page.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fifa World Cup Album',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {
        '/': (_) => const SplashRoute(),
        '/home': (_) => const HomePage(),
        '/auth/login': (_) => const LoginPage()
      },
    );
  }
}
