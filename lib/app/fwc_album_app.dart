import 'package:dartweek_fwc/app/core/ui/global/global_context_impl.dart';
import 'package:dartweek_fwc/app/pages/home/home_route.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/my_stickers_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'core/rest/custom_dio.dart';
import 'core/ui/global/global_context.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_route.dart';
import 'pages/auth/register/register_route.dart';
import 'pages/my_stickers/my_stickers_route.dart';
import 'pages/splash/splash_route.dart';
import 'repository/auth/auth_repository.dart';
import 'repository/auth/auth_repository_impl.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>((i) =>
            GlobalContextImpl(navigatorKey: navigatorKey, repository: i()))
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Fifa World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/home': (_) => const HomeRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/my-stickers': (_) => const MyStickersRoute(),
        },
      ),
    );
  }
}
