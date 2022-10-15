import 'package:dartweek_fwc/app/models/user_stickers_model.dart';
import 'package:dartweek_fwc/app/pages/stickers_details/presenter/sticker_details_presenter.dart';
import 'package:dartweek_fwc/app/pages/stickers_details/view/sticker_details_view.dart';
import 'package:dartweek_fwc/app/services/sticker/find_sticker_service.dart';

import '../../../models/sticker_model.dart';

class StickerDetailsPresenterImpl implements StickerDetailsPresenter {
  late final StickerDetailsView _view;
  final FindStickerService service;
  UserStickersModel? stickerUser;
  StickerModel? sticker;
  int amount = 0;

  StickerDetailsPresenterImpl({
    required this.service,
  });

  @override
  set view(StickerDetailsView view) => _view = view;

  @override
  Future<void> load(
      {required String countryCode,
      required String stickerNumber,
      required String countryName,
      UserStickersModel? stickerUser}) async {
    this.stickerUser = stickerUser;
    if (stickerUser == null) {
      sticker = await service.execute(countryCode, stickerNumber);
    }


    bool hasSticker = stickerUser != null;
   
    if (hasSticker) {
      amount = stickerUser.duplicates + 1;
    }

    _view.screenLoaded(hasSticker, countryCode, stickerNumber, countryName, amount);
  }
}
