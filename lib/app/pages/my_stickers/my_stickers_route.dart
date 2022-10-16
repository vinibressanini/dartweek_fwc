import 'package:dartweek_fwc/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/presenter/my_stickers_presenter_impl.dart';
import 'package:dartweek_fwc/app/repository/stickers/stickers_repository.dart';
import 'package:dartweek_fwc/app/repository/stickers/stickers_repository_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'my_stickers_page.dart';

class MyStickersRoute extends FlutterGetItPageRoute {
  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<MyStickersPresenter>(
            (i) => MyStickersPresenterImpl(repository: i()))
      ];

  @override
  WidgetBuilder get page =>
      (context) => MyStickersPage(presenter: context.get());
}
