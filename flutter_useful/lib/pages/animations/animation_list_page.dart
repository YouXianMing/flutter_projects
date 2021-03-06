import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/route/route_config.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/base/others/sliver_section/sliver_list/sliver_list_section.dart';
import 'package:project_base_libs_pkg/base/widgets/widget_callback_mixin.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class AnimationListPage extends NormalStatelessWidget with WidgetEventCallbackMixin {
  AnimationListPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget backgroundWidget(BuildContext context) => Container(color: Colors.white);

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverListSection(
          items: [
            CartItemModel(title: '动画基本使用', route: RouteConfig.baseAnimatedPage),
            CartItemModel(title: '组合动画', route: RouteConfig.groupAnimationPage),
            CartItemModel(title: '分段动画', route: RouteConfig.tweenSequenceAnimationPage),
            CartItemModel(title: 'AnimatedWidget使用', route: RouteConfig.animatedWidgetPage),
            CartItemModel(title: 'AnimationsManager的使用', route: RouteConfig.animationsManagerPage),
            CartItemModel(title: 'AnimationsManager的重复使用', route: RouteConfig.animationsManagerRandomPage),
            CartItemModel(title: 'AnimationsManager的Curves', route: RouteConfig.animationsManagerCurvesPage),
            CartItemModel(title: 'AnimationsManager与Interval配合使用', route: RouteConfig.animationsManagerIntervalPage),
            CartItemModel(title: 'AnimationsManager与Sequence配合使用', route: RouteConfig.animationsManagerSequencePage),
            CartItemModel(title: '添加购物车动画', route: RouteConfig.goodsAddToCartPage),
          ],
          builder: (c, i, d) => CartItemWidget(model: d, callback: widgetEventCallback),
        ).buildWidget(),
      ],
    );
  }

  @override
  void widgetEventCallback(BuildContext? context, WidgetEventItem eventItem) {
    if (eventItem.data is CartItemModel) {
      Get.toNamed(eventItem.data.route!, arguments: eventItem.data);
    }
  }
}
