import 'package:dartweek_fwc/app/core/config/env/env.dart';
import 'package:flutter/cupertino.dart';

import 'app/fwc_album_app.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(FwcAlbumApp());
}
