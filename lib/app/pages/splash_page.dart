import 'package:dartweek_fwc/app/core/styles/button_styles.dart';
import 'package:dartweek_fwc/app/core/styles/colors_app.dart';
import 'package:dartweek_fwc/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyles.instance.yellowButton,
            child: const Text('Olá'),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyles.instance.primaryButton,
            child: const Text('Olá'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyles.instance.outlinedYellowButton,
            child: const Text('Olá'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyles.instance.outlinedPrimaryButton,
            child: const Text('Olá'),
          ),
          const TextField(),
        ],
      ),
    );
  }
}
