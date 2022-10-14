import 'package:dartweek_fwc/app/core/mvp/fwc_presenter.dart';
import 'package:dartweek_fwc/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView>{
  Future<void> getUserData();
  Future<void> logout();
}