import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class GroupAnimationPage extends NormalStatelessWidget {
  GroupAnimationPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) => _GroupAnimationDemo();
}

class _GroupAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupAnimationDemoState();
}

class _GroupAnimationDemoState extends State<_GroupAnimationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animationController.addListener(() {
      setState(() {});
    });

    /// 动画总时间5秒
    /// Interval(0.0, 0.80) 表示从0秒到4秒(总时间的4/5,通过百分比计算得出)
    /// Interval(0.80, 1.0) 表示从4秒到5秒(总时间的1/5,通过百分比计算得出)

    _colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.0, 0.80)));

    _sizeAnimation = Tween(begin: 100.0, end: 300.0)
        .animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.80, 1.0, curve: Curves.bounceOut)));

    //开始动画
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: _sizeAnimation.value,
            width: _sizeAnimation.value,
            color: _colorAnimation.value,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
