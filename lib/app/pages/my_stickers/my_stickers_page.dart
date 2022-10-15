import 'package:dartweek_fwc/app/pages/my_stickers/widgets/sticker_group.dart';
import 'package:dartweek_fwc/app/pages/my_stickers/widgets/sticker_status_filter.dart';
import 'package:flutter/material.dart';

import 'widgets/sticker_group_filter.dart';

class MyStickersPage extends StatefulWidget {
  const MyStickersPage({super.key});

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends State<MyStickersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                StickerStatusFilter(),
                StickerGroupFilter(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const StickerGroup();
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
