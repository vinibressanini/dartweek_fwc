import 'package:dartweek_fwc/app/core/mvp/fwc_presenter.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/view/my_stickers_view.dart';

abstract class MyStickersPresenter implements FwcPresenter<MyStickersView>{
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);

  void refresh();
}