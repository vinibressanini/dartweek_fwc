import 'package:dartweek_fwc/app/models/user_stickers_model.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:flutter/material.dart';

import 'package:dartweek_fwc/app/core/ui/styles/colors_app.dart';
import 'package:dartweek_fwc/app/core/ui/styles/text_styles.dart';
import 'package:dartweek_fwc/app/models/group_stickers_model.dart';
import 'package:flutter_getit/flutter_getit.dart';

class StickerGroup extends StatelessWidget {
  final String statusFilter;

  final GroupStickersModel group;

  const StickerGroup({
    Key? key,
    required this.group,
    required this.statusFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.12,
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 2).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              group.countryName,
              style:
                  context.textStyles.textPrimaryFontBold.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickerNumber);
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;
              final stickersWidget = Sticker(
                stickerNumber: stickerNumber.toString(),
                sticker: sticker,
                countryCode: group.countryCode,
                countryName: group.countryName,
              );

              if (statusFilter == 'all') {
                return stickersWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickersWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicates > 1) {
                  return stickersWidget;
                }
              }

              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickersModel? sticker;
  final String countryCode;
  final String countryName;
  const Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryCode,
    required this.countryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final presenter = context.get<MyStickersPresenter>();
        await Navigator.of(context).pushNamed('/stickers_details', arguments: {
          'countryCode': countryCode,
          'countryName': countryName,
          'stickerUser': sticker,
          'stickerNumber': stickerNumber
        });
        presenter.refresh();
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                sticker != null ? context.colors.primary : context.colors.grey),
        child: Column(
          children: [
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: (sticker?.duplicates ?? 0) > 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.topRight,
                child: Text(
                  sticker?.duplicates.toString() ?? '',
                  style: context.textStyles.textSecondaryFontMedium
                      .copyWith(color: context.colors.yellow),
                ),
              ),
            ),
            Text(
              countryCode,
              style: sticker != null
                  ? context.textStyles.textSecondaryFontExtraBold
                      .copyWith(color: Colors.white)
                  : context.textStyles.textSecondaryFontExtraBold,
            ),
            Text(
              stickerNumber,
              style: sticker != null
                  ? context.textStyles.textSecondaryFontExtraBold
                      .copyWith(color: Colors.white)
                  : context.textStyles.textSecondaryFontExtraBold,
            ),
          ],
        ),
      ),
    );
  }
}
