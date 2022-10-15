import 'package:dartweek_fwc/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:flutter/material.dart';

import 'package:dartweek_fwc/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/widgets/sticker_group.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/widgets/sticker_status_filter.dart';

import 'view/my_stickers_view_impl.dart';
import 'widgets/sticker_group_filter.dart';

class MyStickersPage extends StatefulWidget {
  final MyStickersPresenter presenter;

  const MyStickersPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickersViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Figurinhas'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                StickerStatusFilter(filterSelected: filterStatus),
                StickerGroupFilter(countries: countries),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final group = album[index];
                return StickerGroup(
                  group: group,
                  statusFilter: filterStatus,
                );
              },
              childCount: album.length,
            ),
          ),
        ],
      ),
    );
  }
}
