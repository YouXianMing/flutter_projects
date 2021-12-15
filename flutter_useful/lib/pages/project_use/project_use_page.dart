import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base/widgets/widget_callback_mixin.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/route/route_config.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:get/get.dart';

class ProjectUsePage extends NormalStatelessWidget with WidgetEventCallbackMixin {
  ProjectUsePage({Key? key}) : super(key: key);

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
            CartItemModel(title: 'SliverSections的使用', route: RouteConfig.sliverSectionsPage),
            CartItemModel(title: 'SliverRefreshWidget', route: RouteConfig.sliverRefreshWidgetPage),
            CartItemModel(title: 'StatusWidget', route: RouteConfig.statusWidgetPage),
            CartItemModel(title: 'InformationView', route: RouteConfig.informationViewPage),
            CartItemModel(title: 'ToastWidget', route: RouteConfig.toastWidgetPage),
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
