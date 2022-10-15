import 'package:dartweek_fwc/app/models/group_stickers_model.dart';
import 'package:dartweek_fwc/app/models/sticker_model.dart';

import '../../models/register_sticker_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickersModel>> getMyAlbum(); 
  Future<StickerModel?> findStickerByCode(String stickerCode, String stickerName); 
  Future<StickerModel> create(RegisterStickerModel registerModel); 
}