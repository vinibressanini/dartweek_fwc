import 'package:dartweek_fwc/app/pages/auth/login/login_page.dart';
import 'package:dartweek_fwc/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:dartweek_fwc/app/pages/auth/login/presenter/login_presenter_impl.dart';
import 'package:dartweek_fwc/app/services/login/login_services.dart';
import 'package:dartweek_fwc/app/services/login/login_services_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LoginRoute extends FlutterGetItPageRoute {
  const LoginRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginServices>(
            (i) => LoginServicesImpl(repository: i())),
        Bind.lazySingleton<LoginPresenter>(
            (i) => LoginPresenterImpl(service: i()))
      ];

  @override
  WidgetBuilder get page => (context) => LoginPage(presenter: context.get());
}
