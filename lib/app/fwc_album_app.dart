import 'package:dartweek_fwc/app/core/ui/theme/theme_config.dart';
import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fifa World Cup Album',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {'/': (context) => const SplashPage()},
    );
  }
}
