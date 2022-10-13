import 'package:dartweek_fwc/app/core/ui/styles/button_styles.dart';
import 'package:dartweek_fwc/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../core/rest/custom_dio.dart';
import '../../core/ui/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Button(
          label: 'Auth Test',
          labelStyle: context.textStyles.textPrimaryFontBold,
          style: context.buttonStyles.yellowButton,
          onPressed: () {
            context.get<CustomDio>().auth().get('/api/me');
          },
        ),
      ),
    );
  }
}
