import 'package:dartweek_fwc/app/core/ui/helpers/messages.dart';
import 'package:dartweek_fwc/app/pages/stickers_details/stickers_details_page.dart';
import 'package:dartweek_fwc/app/pages/stickers_details/view/sticker_details_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/ui/helpers/loader.dart';

abstract class StickerDetailsViewImpl extends State<StickersDetailsPage>
    with Loader<StickersDetailsPage>, Messages<StickersDetailsPage>
    implements StickerDetailsView {
  bool hasSticker = false;
  String countryCode = 'BRA';
  String stickerNumber = '19';
  String countryName = 'Brasil';
  int amount = 0;
  @override
  void initState() {
    widget.presenter.view = this;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      var arguments = ModalRoute.of(context)?.settings.arguments;

      if (arguments != null && arguments is Map<String, dynamic>) {
        widget.presenter.load(
          countryCode: arguments['countryCode'],
          stickerNumber: arguments['stickerNumber'],
          countryName: arguments['countryName'],
          stickerUser: arguments['stickerUser']
        );
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError('Não foi possível carregar a figurinha');
      }
    });
    super.initState();
  }

  @override
  void screenLoaded(bool hasSticker, String countryCode, String stickerNumber,
      String countryName, int amount) {
    hideLoader();
    setState(() {
      this.hasSticker = hasSticker;
      this.countryCode = countryCode;
      this.stickerNumber = stickerNumber;
      this.countryName = countryName;
      this.amount = amount;
    });
  }
}
