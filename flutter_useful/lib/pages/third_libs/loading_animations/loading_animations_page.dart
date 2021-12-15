import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class LoadingAnimationsPage extends NormalStatelessWidget {
  LoadingAnimationsPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGridSection(
          crossAxisCount: 2,
          items: [
            LoadingAnimation.flippingCircle,
            LoadingAnimation.flippingSquare,
            LoadingAnimation.rotatingSquare,
            LoadingAnimation.doubleFlippingCircle,
            LoadingAnimation.doubleFlippingSquare,
            LoadingAnimation.bouncingGridCircle,
            LoadingAnimation.bouncingGridSquare,
            LoadingAnimation.fillingSquare,
            LoadingAnimation.fadingLineCircle,
            LoadingAnimation.fadingLineSquare,
            LoadingAnimation.bouncingLineCircle,
            LoadingAnimation.bouncingLineSquare,
            LoadingAnimation.jumpingLineCircle,
            LoadingAnimation.jumpingLineSquare,
            LoadingAnimation.bumpingLineCircle,
            LoadingAnimation.bumpingLineSquare,
          ],
          builder: (c, i, d) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoadingAnimationWidget(
                type: d,
                backgroundColor: Colors.transparent,
                borderColor: Util.randomOpaqueColor,
              ),
              WidgetsFactory.text(d.toString().split('.').last)
            ],
          ),
        ).buildWidget(),
      ],
    );
  }
}
