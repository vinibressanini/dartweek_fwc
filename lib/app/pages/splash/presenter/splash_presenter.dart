import 'package:dartweek_fwc/app/core/mvp/fwc_presenter.dart';

abstract class SplashPresenter extends FwcPresenter {
  Future<void> chechLogin();  
}