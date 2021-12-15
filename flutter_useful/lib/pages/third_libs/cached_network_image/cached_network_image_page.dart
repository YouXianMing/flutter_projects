import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class CachedNetworkImagePage extends NormalStatelessWidget {
  CachedNetworkImagePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: 'https://pic.cnblogs.com/avatar/607542/20151017230728.png',
        placeholder: (context, url) => const Icon(Icons.download),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ).addDebugContainer(borderColor: Colors.blueGrey),
    );
  }
}
