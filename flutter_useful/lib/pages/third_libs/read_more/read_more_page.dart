import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';
import 'package:readmore/readmore.dart';

class ReadMorePage extends NormalStatelessWidget {
  ReadMorePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(10),
          child: ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            trimLines: 2,
            style: TextStyle(color: Colors.black, height: 1.5),
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...Show more',
            trimExpandedText: ' show less',
          ),
        ),
        Divider(color: Colors.grey),
        Padding(
          padding: EdgeInsets.all(10),
          child: ReadMoreText(
            '拜登政府5月曾下令让美国情报部门在90天内提交一份新冠病毒源头调查报告。所以，美国情报部门，3个月内你们真的能完成吗？美国一些政客试图用政治手段来回答这样一个科学问题，那么问题来了，如果用“政治编造”+“谎言污蔑”造出这样一份溯源调查报告，会有人相信吗？美国情报部门，请回答！(记者 冰洁 摄像 王潮 制作 周璟 技术 杨思雨 孙红卫）',
            trimLines: 3,
            style: TextStyle(color: Colors.black, height: 1.5),
            colorClickableText: Colors.blue,
            trimMode: TrimMode.Line,
            trimCollapsedText: '展开',
            trimExpandedText: '收起',
          ),
        ),
      ],
    );
  }
}
