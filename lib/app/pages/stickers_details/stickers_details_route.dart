import 'package:dartweek_fwc/app/pages/stickers_details/presenter/sticker_details_presenter.dart';
import 'package:dartweek_fwc/app/repository/stickers/stickers_repository.dart';
import 'package:dartweek_fwc/app/services/sticker/find_sticker_service.dart';
import 'package:dartweek_fwc/app/services/sticker/find_sticker_service_impl.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../repository/stickers/stickers_repository_impl.dart';
import 'presenter/sticker_details_presenter_impl.dart';
import 'stickers_details_page.dart';

class StickersDetailsRoute extends FlutterGetItPageRoute {
  const StickersDetailsRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<FindStickerService>(
            (i) => FindStickerServiceImpl(repository: i())),
        Bind.lazySingleton<StickerDetailsPresenter>(
            (i) => StickerDetailsPresenterImpl(service: i(), repository: i()))
      ];

  @override
  WidgetBuilder get page => (context) => StickersDetailsPage(
        presenter: context.get(),
      );
}
