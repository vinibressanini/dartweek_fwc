import 'package:dartweek_fwc/app/core/ui/helpers/loader.dart';
import 'package:dartweek_fwc/app/core/ui/helpers/messages.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/my_stickers_page.dart';
import 'package:flutter/material.dart';

abstract class StickerDetailsView{
  void screenLoaded(bool hasSticker, String countryCode, String stickerNumber, String countryName, int amount);
}