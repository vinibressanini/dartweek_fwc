import 'package:dartweek_fwc/app/core/mvp/fwc_presenter.dart';
import 'package:dartweek_fwc/app/models/user_stickers_model.dart';

import '../view/sticker_details_view.dart';

abstract class StickerDetailsPresenter
    extends FwcPresenter<StickerDetailsView> {
  
  
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickersModel? stickerUser,
  });
}
