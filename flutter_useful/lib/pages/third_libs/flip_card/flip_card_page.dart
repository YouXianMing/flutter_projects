import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateful_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class FlipCardPage extends NormalStatefulWidget {
  const FlipCardPage({Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => FlipCardPageState();
}

class FlipCardPageState extends NormalStatefulWidgetState<FlipCardPage> {
  late FlipCardController controller;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  void initState() {
    super.initState();
    controller = FlipCardController();
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlipCard(
            controller: controller,
            direction: FlipDirection.HORIZONTAL,
            front: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.blue,
              child: WidgetsFactory.text('正面', fontSize: 20, color: Colors.white),
            ),
            back: Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              color: Colors.red,
              child: WidgetsFactory.text('反面', fontSize: 20, color: Colors.white),
            ),
          ),
          TextButton(onPressed: () => controller.toggleCard(), child: WidgetsFactory.text('翻转')),
          TextButton(
              onPressed: () => controller.skew(Util.randomPercent, duration: const Duration(milliseconds: 500), curve: Curves.easeInOutCubic),
              child: WidgetsFactory.text('随机角度')),
          TextButton(
              onPressed: () => controller.hint(duration: const Duration(milliseconds: 1100), total: const Duration(milliseconds: 1000)),
              child: WidgetsFactory.text('暗示(该控件可以翻转)')),
        ],
      ),
    );
  }
}
