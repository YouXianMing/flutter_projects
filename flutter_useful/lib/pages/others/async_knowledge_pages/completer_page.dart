import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateful_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/base/others/widgets_factory.dart';
import 'package:project_base_libs_pkg/base/tools/util.dart';
import 'package:project_base_libs_pkg/base/widgets/base_stateful_widget.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class CompleterPage extends NormalStatefulWidget {
  const CompleterPage({Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => CompleterPageState();
}

class CompleterPageState extends NormalStatefulWidgetState<CompleterPage> {
  // 相当于信号量
  late Completer completer;
  String info = '等待中';

  @override
  void initState() {
    super.initState();
    completer = Completer();
    startFuture();
  }

  void startFuture() async {
    Future.delayed(Duration(seconds: Util.randomInt(max: 4, min: 1)), () {
      completer.complete('结果');
    });

    info = await completer.future;
    setState(() {});
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(context: context, title: NormalAppBar.titleWidget(Get.arguments));

  @override
  Widget body(BuildContext context) {
    return Center(child: WidgetsFactory.text(info));
  }
}
