import 'package:dartweek_fwc/app/pages/splash/presenter/splash_presenter.dart';
import 'package:flutter/material.dart';

import '../view/splash_view.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> chechLogin() async {
    _view.showLoader();
    await Future.delayed(const Duration(seconds: 2));
    _view.logged(false);
  }

  @override
  set view(view) => _view = view;
}
