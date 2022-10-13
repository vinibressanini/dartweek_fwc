
import 'package:dartweek_fwc/app/core/ui/helpers/messages.dart';
import 'package:dartweek_fwc/app/pages/auth/login/login_page.dart';
import 'package:dartweek_fwc/app/pages/auth/login/view/login_view.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/ui/helpers/loader.dart';

abstract class LoginViewImpl extends State<LoginPage> with Loader<LoginPage>, Messages<LoginPage> implements LoginView{

  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void successful() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
  
}