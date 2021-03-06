import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPage extends NormalStatelessWidget {
  ShimmerPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.withOpacity(0.3),
        period: const Duration(milliseconds: 1500),
        child: const Padding(padding: EdgeInsets.all(40), child: Text('Shimmer', style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.w300))),
      ),
    );
  }
}
