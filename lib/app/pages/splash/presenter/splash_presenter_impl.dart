import 'package:dartweek_fwc/app/pages/splash/presenter/splash_presenter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/splash_view.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> chechLogin() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');

    _view.logged(accessToken != null ? true : false);
    
  }

  @override
  set view(view) => _view = view;
}
