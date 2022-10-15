import 'package:dartweek_fwc/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:flutter/material.dart';

import 'package:dartweek_fwc/app/core/ui/styles/button_styles.dart';
import 'package:dartweek_fwc/app/core/ui/styles/colors_app.dart';
import 'package:dartweek_fwc/app/core/ui/styles/text_styles.dart';
import 'package:dartweek_fwc/app/core/ui/widgets/button.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerStatusFilter extends StatefulWidget {
  final String filterSelected;

  const StickerStatusFilter({
    Key? key,
    required this.filterSelected,
  }) : super(key: key);

  @override
  State<StickerStatusFilter> createState() => _StickerStatusFilterState();
}

class _StickerStatusFilterState extends State<StickerStatusFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              context.get<MyStickersPresenter>().statusFilter('all');
            },
            style: widget.filterSelected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: widget.filterSelected == 'all'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Todas',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              context.get<MyStickersPresenter>().statusFilter('missing');
            },
            style: widget.filterSelected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: widget.filterSelected == 'missing'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            onPressed: () {
              context.get<MyStickersPresenter>().statusFilter('repeated');
            },
            style: widget.filterSelected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: widget.filterSelected == 'repeated'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Repetidas',
          ),
        ],
      ),
    );
  }
}
