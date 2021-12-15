import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicatorsPage extends NormalStatelessWidget {
  LoadingIndicatorsPage({Key? key}) : super(key: key);

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
          items: Indicator.values,
          builder: (c, i, d) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 100.w, child: LoadingIndicator(indicatorType: d, backgroundColor: Util.randomOpaqueColor)),
              WidgetsFactory.text(d.toString().split('.').last),
            ],
          ),
        ).buildWidget(),
      ],
    );
  }
}
