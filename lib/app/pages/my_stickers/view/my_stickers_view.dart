import '../../../models/group_stickers_model.dart';

abstract class MyStickersView {
  void loadPage(List<GroupStickersModel> album);
  void error(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupStickersModel> album);
}