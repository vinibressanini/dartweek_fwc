import 'package:dartweek_fwc/app/pages/home/presenter/home_presenter.dart';
import 'package:dartweek_fwc/app/pages/home/presenter/home_presenter_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../repository/user/user_repository.dart';
import '../../repository/user/user_repository_impl.dart';
import 'home_page.dart';

class HomeRoute extends FlutterGetItPageRoute {
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(dio: i())),
        Bind.lazySingleton<HomePresenter>((i) => HomePresenterImpl(repository: i()))
      ];

  @override
  WidgetBuilder get page => (context) => HomePage(presenter: context.get());
}
