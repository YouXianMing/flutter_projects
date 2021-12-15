import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:flutter_useful/pages/base/normal_stateful_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class StaggeredGridViewPage extends NormalStatefulWidget {
  const StaggeredGridViewPage({Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => StaggeredGridViewPageState();
}

class StaggeredGridViewPageState extends NormalStatefulWidgetState<StaggeredGridViewPage> {
  final List<StaggeredTile> _tiles = <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(4, 1),
    const StaggeredTile.count(4, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 4),
    const StaggeredTile.count(1, 3),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
  ];

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverStaggeredGrid.countBuilder(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            itemCount: _tiles.length,
            staggeredTileBuilder: (int index) => _tiles[index],
            itemBuilder: (BuildContext context, int index) {
              return Container(color: Util.randomOpaqueColor.withOpacity(0.2), alignment: Alignment.center, child: Text(index.toString()));
            },
          ),
        ),
        SliverBoxAdapterSection.widget(
            builder: (d) => const SafeAreaPaddingWidget(type: SafeAreaPadding.bottom, backgroundColor: Colors.transparent)),
      ],
    );
  }
}
