import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/async_await_example_page.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/completer_page.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/dart_async_page.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/dart_future_page.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/dart_stream_page.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/future_builder_page.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/isolate_page.dart';
import 'package:flutter_useful/pages/others/async_knowledge_pages/stream_builder_page.dart';
import 'package:flutter_useful/widgets/app_widgets.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class AsyncKnowledgePage extends NormalStatelessWidget {
  AsyncKnowledgePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget backgroundWidget(BuildContext context) => Container(color: Colors.white);

  @override
  Widget body(BuildContext context) {
    return ListItemView(
      cells: [
        ListItemCell(content: 'async 与 await', onTap: (s) => Get.to(() => AsyncAwaitExamplePage(), arguments: s)),
        ListItemCell(content: 'Dart的事件循环', onTap: (s) => Get.to(() => DartAsyncPage(), arguments: s)),
        ListItemCell(content: 'Future', onTap: (s) => Get.to(() => const DartFuturePage(), arguments: s)),
        ListItemCell(content: 'Stream', onTap: (s) => Get.to(() => const DartStreamPage(), arguments: s)),
        ListItemCell(content: 'FutureBuilder', onTap: (s) => Get.to(() => FutureBuilderPage(), arguments: s)),
        ListItemCell(content: 'StreamBuilder', onTap: (s) => Get.to(() => const StreamBuilderPage(), arguments: s)),
        ListItemCell(content: 'Completer', onTap: (s) => Get.to(() => const CompleterPage(), arguments: s)),
        ListItemCell(content: 'Isolate', onTap: (s) => Get.to(() => const IsolatePage(), arguments: s)),
      ],
    );
  }
}
