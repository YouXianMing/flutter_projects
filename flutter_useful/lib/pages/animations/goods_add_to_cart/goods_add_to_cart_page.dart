import 'package:flutter/material.dart';
import 'package:flutter_useful/pages/base/normal_stateless_widget.dart';
import 'package:flutter_useful/widgets/card_item_widget.dart';
import 'package:flutter_useful/widgets/custom_app_bar.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'dart:math' as math;

class GoodsAddToCartPage extends NormalStatelessWidget {
  GoodsAddToCartPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget((Get.arguments as CartItemModel).title),
      );

  @override
  Widget body(BuildContext context) => const AnimationsManagerUseDemo();
}

class AnimationsManagerUseDemo extends StatefulWidget {
  const AnimationsManagerUseDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimationsManagerUseDemoState();
}

class _AnimationsManagerUseDemoState extends State<AnimationsManagerUseDemo> with TickerProviderStateMixin {
  static const String alpha = 'alpha';
  static const String scale = 'scale';
  static const String offsetX = 'offsetX';
  static const String offsetY = 'offsetY';
  late AnimationsManager cartAnimationsManager;

  late Widget itemWidget;
  GlobalKey cartKey = GlobalKey();
  GlobalKey itemKey = GlobalKey();

  static const String rotate = 'rotate';
  late AnimationsManager rotateAnimationsManager;

  @override
  void initState() {
    super.initState();

    itemWidget = Container(width: 80, height: 80, color: Colors.red, key: itemKey);

    rotateAnimationsManager = AnimationsManager(
      tickerProvider: this,
      duration: const Duration(milliseconds: 300),
      animationObjectMap: {
        rotate: TweenSequenceObject(
          items: [
            TweenSequenceItem(tween: Tween<double>(begin: 0, end: math.pi * 0.15).chain(CurveTween(curve: Curves.linear)), weight: 1),
            TweenSequenceItem(tween: Tween<double>(begin: math.pi * 0.15, end: -math.pi * 0.15).chain(CurveTween(curve: Curves.linear)), weight: 1),
            TweenSequenceItem(tween: Tween<double>(begin: -math.pi * 0.15, end: 0).chain(CurveTween(curve: Curves.linear)), weight: 1),
          ],
        ),
      },
    );

    // ???????????????
    cartAnimationsManager = AnimationsManager(
        tickerProvider: this,
        duration: const Duration(seconds: 2, milliseconds: 100),
        animationObjectMap: {
          alpha: TweenSequenceObject(
            items: [
              TweenSequenceItem(tween: ConstantTween<double>(0), weight: 0.1), // ??????????????????????????????????????????
              TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.linear)), weight: 1),
              TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.1).chain(CurveTween(curve: Curves.linear)), weight: 1),
            ],
          ),
          scale: TweenSequenceObject(
            items: [
              TweenSequenceItem(tween: ConstantTween<double>(1), weight: 0.1), // ??????????????????????????????????????????
              TweenSequenceItem(tween: Tween<double>(begin: 2, end: 1).chain(CurveTween(curve: Curves.easeOutQuint)), weight: 1),
              TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.4).chain(CurveTween(curve: Curves.easeOutQuint)), weight: 1),
            ],
          ),
          offsetX: TweenSequenceObject(items: [TweenSequenceItem(tween: ConstantTween<double>(0), weight: 1)]),
          offsetY: TweenSequenceObject(items: [TweenSequenceItem(tween: ConstantTween<double>(0), weight: 1)]),
        },
        completedCallback: () {
          rotateAnimationsManager.forward();
        });

    // ??????1??????????????????
    Util.delayedSeconds(1, () {
      Offset offsetCart = cartKey.globalPaintCenterPoint!;
      Offset offsetItem = itemKey.globalPaintCenterPoint!;
      Offset offset = offsetCart - offsetItem;

      // ??????offsetX???offsetY??????
      cartAnimationsManager
          .setAnimationObject(
            key: offsetX,
            value: TweenSequenceObject(
              items: [
                TweenSequenceItem(tween: ConstantTween<double>(0), weight: 0.1), // ??????????????????????????????????????????
                TweenSequenceItem(tween: ConstantTween<double>(0), weight: 1),
                TweenSequenceItem(tween: Tween<double>(begin: 0, end: offset.dx).chain(CurveTween(curve: Curves.linear)), weight: 1),
              ],
            ),
          )
          .setAnimationObject(
            key: offsetY,
            value: TweenSequenceObject(
              items: [
                TweenSequenceItem(tween: ConstantTween<double>(0), weight: 0.1), // ??????????????????????????????????????????
                TweenSequenceItem(tween: ConstantTween<double>(0), weight: 1),
                TweenSequenceItem(tween: Tween<double>(begin: 0, end: offset.dy).chain(CurveTween(curve: Curves.easeInExpo)), weight: 1),
              ],
            ),
          );

      cartAnimationsManager.forward();
    });
  }

  @override
  void dispose() {
    cartAnimationsManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(), cartItemsAnimationWidget(), Positioned(bottom: 50, left: 30, child: cartIconAnimationWidget())],
    );
  }

  Widget cartItemsAnimationWidget() {
    return cartAnimationsManager.animatedBuilder(
      child: itemWidget,
      builder: (context, child) => Opacity(
        opacity: cartAnimationsManager.animationByKey(alpha).value,
        child: Transform.translate(
          offset: Offset(cartAnimationsManager.animationByKey(offsetX).value, cartAnimationsManager.animationByKey(offsetY).value),
          child:
              Transform.scale(scale: cartAnimationsManager.animationByKey(scale).value, child: Container(alignment: Alignment.center, child: child)),
        ),
      ),
    );
  }

  Widget cartIconAnimationWidget() {
    return rotateAnimationsManager.animatedBuilder(
        child: Icon(Icons.add_shopping_cart, size: 40, key: cartKey),
        builder: (context, child) {
          return Transform.rotate(angle: rotateAnimationsManager.animationByKey(rotate).value, child: child);
        });
  }
}
