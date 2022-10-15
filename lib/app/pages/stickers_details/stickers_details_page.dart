import 'package:dartweek_fwc/app/core/ui/styles/button_styles.dart';
import 'package:flutter/material.dart';

import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/button.dart';
import '../../core/ui/widgets/rounded_button.dart';

class StickersDetailsPage extends StatelessWidget {
  const StickersDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes Figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/sticker_pb.png'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BRA 17',
                          style: context.textStyles.titleBlack,
                        ),
                        Text(
                          'Brasil',
                          style: context.textStyles.textPrimaryFontRegular
                              .copyWith(color: context.colors.darkGrey),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  RoundedButton(
                    onPressed: () {},
                    icon: Icons.remove,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      '0',
                      style: context.textStyles.textSecondaryFontMedium,
                    ),
                  ),
                  RoundedButton(
                    onPressed: () {},
                    icon: Icons.add,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Button.primary(
                label: 'Adicionar Figurinha',
                onPressed: () {},
                width: MediaQuery.of(context).size.width * .9,
              ),
              Button(
                style: context.buttonStyles.outlinedPrimaryButton,
                labelStyle:
                    context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                label: 'Excluir Figurinha',
                onPressed: () {},
                width: MediaQuery.of(context).size.width * .9,
                outlined: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
