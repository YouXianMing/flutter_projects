import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:flutter_useful/pages/base/normal_stateful_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class StreamBuilderPage extends NormalStatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends NormalStatefulWidgetState<StreamBuilderPage> {
  Stream? _stream;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(context: context, title: NormalAppBar.titleWidget(Get.arguments));

  @override
  void initState() {
    super.initState();

    /// 1秒之后设置stream
    Future.delayed(const Duration(seconds: 1), () {
      Future<String> future_1 = Future.delayed(const Duration(seconds: 2), () => '数据1');
      Future<String> future_2 = Future.delayed(const Duration(seconds: 3), () => '数据2');
      Future<String> future_3 = Future.delayed(const Duration(seconds: 4), () => '数据3');
      _stream = Stream.fromFutures([future_1, future_2, future_3]);
      setState(() {});
    });
  }

  @override
  Widget body(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return _info('[none] 没有Stream', Colors.grey);
          case ConnectionState.waiting:
            return _info('[waiting] 等待数据...', Colors.red);
          case ConnectionState.active:
            return _info('[active] ${snapshot.data}', Colors.green);
          case ConnectionState.done:
            return _info('[done] ${snapshot.data} Stream已关闭', Colors.blueAccent);
        }
      },
    );
  }

  Widget _info(String text, Color color) {
    return Center(
      child: Container(
        color: color,
        padding: const EdgeInsets.all(10),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
