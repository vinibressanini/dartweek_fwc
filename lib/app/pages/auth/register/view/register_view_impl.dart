import 'package:dartweek_fwc/app/core/ui/helpers/messages.dart';
import 'package:dartweek_fwc/app/pages/auth/register/view/register_view.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../register_page.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Loader<RegisterPage>, Messages<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerFailed([String? message]) {
    hideLoader();
    showError(message ?? 'Erro Ao Registrar Usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuário Cadastrado com Sucesso!');
    Navigator.of(context).pop();
  }
}
