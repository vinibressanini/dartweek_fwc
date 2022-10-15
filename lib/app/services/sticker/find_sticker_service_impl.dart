import 'package:dartweek_fwc/app/models/register_sticker_model.dart';
import 'package:dartweek_fwc/app/models/sticker_model.dart';
import 'package:dartweek_fwc/app/repository/stickers/stickers_repository.dart';
import 'package:dartweek_fwc/app/services/sticker/find_sticker_service.dart';

class FindStickerServiceImpl implements FindStickerService {
  final StickersRepository repository;

  FindStickerServiceImpl({
    required this.repository,
  });

  @override
  Future<StickerModel> execute(String stickerCode, String stickerNumber) async {
    var sticker =
        await repository.findStickerByCode(stickerCode, stickerNumber);
    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
        name: '',
        stickerCode: stickerCode,
        stickerNumber: stickerNumber,
      );

      sticker = await repository.create(registerSticker);
    }
    return sticker;
  }
}
