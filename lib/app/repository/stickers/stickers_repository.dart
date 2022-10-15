import 'package:dartweek_fwc/app/models/group_stickers_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickersModel>> getMyAlbum(); 
}