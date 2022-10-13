import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'core/rest/custom_dio.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_route.dart';
import 'pages/auth/register/register_route.dart';
import 'pages/home/home_page.dart';
import 'pages/splash/splash_route.dart';
import 'repository/auth/auth_repository.dart';
import 'repository/auth/auth_repository_impl.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i()))
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/home': (_) => const HomePage(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register' : (_) => const RegisterRoute()
        },
      ),
    );
  }
}
