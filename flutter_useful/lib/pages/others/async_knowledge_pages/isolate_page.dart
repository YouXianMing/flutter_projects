import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateful_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class IsolatePage extends NormalStatefulWidget {
  const IsolatePage({Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => CompleterPageState();
}

class CompleterPageState extends NormalStatefulWidgetState<IsolatePage> {
  final receivePort = ReceivePort();
  late String info = '等待中';

  @override
  void initState() {
    super.initState();
    startIsolate();
  }

  void startIsolate() async {
    // 传输多个参数
    // https://stackoverflow.com/questions/63707220/how-to-pass-arguments-besides-sendport-to-a-spawned-isolate-in-dart
    final isolate = await Isolate.spawn(isolateMethod, [receivePort.sendPort, 3]);

    receivePort.listen((message) {
      // 更新数据
      info = message.toString();
      setState(() {});

      // 关闭receivePort
      receivePort.close();

      // 杀死isolate
      isolate.kill();
    });
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(context: context, title: NormalAppBar.titleWidget(Get.arguments));

  @override
  Widget body(BuildContext context) {
    return Center(child: WidgetsFactory.text(info));
  }
}

void isolateMethod(List<dynamic> arguments) async {
  SendPort sendPort = arguments[0];
  int number = arguments[1];
  await Future.delayed(const Duration(seconds: 2));
  sendPort.send(42 + number);
}
