import 'package:flutter/material.dart';

import 'package:dartweek_fwc/app/core/ui/styles/button_styles.dart';
import 'package:dartweek_fwc/app/pages/stickers_details/presenter/sticker_details_presenter.dart';
import 'package:dartweek_fwc/app/pages/stickers_details/view/stickers_details_view_impl.dart';

import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/button.dart';
import '../../core/ui/widgets/rounded_button.dart';

class StickersDetailsPage extends StatefulWidget {
  final StickerDetailsPresenter presenter;

  const StickersDetailsPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<StickersDetailsPage> createState() => _StickersDetailsPageState();
}

class _StickersDetailsPageState extends StickerDetailsViewImpl {
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
              Image.asset(hasSticker
                  ? 'assets/images/sticker.png'
                  : 'assets/images/sticker_pb.png'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$countryCode $stickerNumber',
                          style: context.textStyles.titleBlack,
                        ),
                        Text(
                          countryName,
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
                      '$amount',
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
