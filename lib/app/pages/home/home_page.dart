import 'package:dartweek_fwc/app/core/ui/styles/button_styles.dart';
import 'package:dartweek_fwc/app/core/ui/styles/colors_app.dart';
import 'package:dartweek_fwc/app/core/ui/styles/text_styles.dart';
import 'package:dartweek_fwc/app/pages/home/widgets/sticker_percent_widget.dart';
import 'package:flutter/material.dart';

import '../../core/ui/widgets/button.dart';
import 'widgets/status_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.png'),
            ),
          ),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(bottom: 35),
                          child: Image.asset(
                            'assets/images/bola.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const StickerPercentWidget(percent: 45),
                        const SizedBox(height: 20),
                        Text(
                          '45 Figurinhas',
                          style: context.textStyles.titleWhite,
                        ),
                        const SizedBox(height: 20),
                        StatusTile(
                          icon: Image.asset('assets/images/all_icon.png'),
                          label: 'Todas',
                          value: 45,
                        ),
                        const SizedBox(height: 20),
                        StatusTile(
                          icon: Image.asset('assets/images/missing_icon.png'),
                          label: 'Faltando',
                          value: 500,
                        ),
                        const SizedBox(height: 20),
                        StatusTile(
                          icon: Image.asset('assets/images/repeated_icon.png'),
                          label: 'Repetidas',
                          value: 30,
                        ),
                        const SizedBox(height: 20),
                        Button(
                          style: context.buttonStyles.outlinedYellowButton,
                          labelStyle: context
                              .textStyles.textSecondaryFontExtraBold
                              .copyWith(color: context.colors.yellow),
                          label: 'Minhas Figurinhas',
                          onPressed: () {},
                          outlined: true,
                          width: MediaQuery.of(context).size.width * .9,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
