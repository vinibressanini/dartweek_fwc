import 'dart:developer';

import 'package:dartweek_fwc/app/pages/home/presenter/home_presenter.dart';
import 'package:dartweek_fwc/app/pages/home/view/home_view.dart';
import 'package:dartweek_fwc/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePresenterImpl implements HomePresenter {
  final UserRepository repository;
  late final HomeView _view;

  HomePresenterImpl({
    required this.repository,
  });

  @override
  Future<void> getUserData() async {
    try {
      _view.showLoader();
      final user = await repository.getMe();
      _view.updateUser(user);
    } catch (e, s) {
      log('Erro ao buscar dados do usuário', error: e, stackTrace: s);
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccessful(); 
  }

  @override
  set view(HomeView view) => _view = view;
}
