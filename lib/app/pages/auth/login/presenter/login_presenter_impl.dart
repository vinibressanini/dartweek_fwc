import 'dart:developer';

import 'package:dartweek_fwc/app/core/exception/unauthorized_exception.dart';
import 'package:dartweek_fwc/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:dartweek_fwc/app/services/login/login_services.dart';

import '../view/login_view.dart';

class LoginPresenterImpl implements LoginPresenter {
  late final LoginView _view;
  final LoginServices service;

  LoginPresenterImpl({
    required this.service,
  });

  @override
  Future<void> login(String email, String password) async {
    try {
      await service.execute(email, password);
      _view.successful();
    } on UnauthorizedException {
      _view.error('Usuário e/ou senha inválidos');
    } catch (e, s) {
      log('Erro ao realizar o login', error: e, stackTrace: s);
      _view.error('Erro ao realizar o login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
