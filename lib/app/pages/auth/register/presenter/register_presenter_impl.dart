import 'dart:developer';

import 'package:dartweek_fwc/app/models/register_user_model.dart';
import 'package:dartweek_fwc/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:dartweek_fwc/app/pages/auth/register/view/register_view.dart';
import 'package:dartweek_fwc/app/repository/auth/auth_repository.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  final AuthRepository repository;

  RegisterPresenterImpl({required this.repository});
  late final RegisterView _view;

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final registerUserModel =
        RegisterUserModel(name, email, password, confirmPassword);

    try {
      await repository.register(registerUserModel);
      _view.registerSuccess();
    } catch (e, s) {
      log('Erro ao Cadastrar usuário', error: e, stackTrace: s);
      _view.registerFailed();
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
