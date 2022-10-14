import 'package:flutter/cupertino.dart';

import 'package:dartweek_fwc/app/repository/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../styles/colors_app.dart';
import 'global_context.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthRepository repository;

  GlobalContextImpl({
    required this.navigatorKey,
    required this.repository,
  });

  @override
  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    showTopSnackBar(
      navigatorKey.currentState!.context,
      overlayState: navigatorKey.currentState!.overlay,
      CustomSnackBar.error(
        message: 'Login Expirado!',
        backgroundColor: ColorsApp.instance.primary,
      ),
    );
    navigatorKey.currentState!.pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }
}
