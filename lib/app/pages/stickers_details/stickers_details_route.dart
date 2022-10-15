import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'stickers_details_page.dart';

class StickersDetailsRoute extends FlutterGetItPageRoute {
  const StickersDetailsRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [];

  @override
  WidgetBuilder get page => (context) => const StickersDetailsPage();
}
