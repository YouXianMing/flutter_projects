import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class AnimatedWidgetPage extends NormalStatelessWidget {
  AnimatedWidgetPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) => const LogoApp();
}

class AnimatedLogo extends AnimatedWidget {
  final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  final _sizeTween = Tween<double>(begin: 100.0, end: 300.0);

  AnimatedLogo({Key? key, Animation<double>? animation}) : super(key: key, listenable: animation!);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}

class LogoApp extends StatefulWidget {
  const LogoApp({Key? key}) : super(key: key);

  @override
  LogoAppState createState() => LogoAppState();
}

class LogoAppState extends State<LogoApp> with TickerProviderStateMixin {
  late AnimationController controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
