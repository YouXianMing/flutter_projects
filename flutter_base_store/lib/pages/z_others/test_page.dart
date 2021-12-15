import 'package:flutter_base_store/headers.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class TestPage extends NormalStatefulWidget {
  final PageArguments? arguments;
  const TestPage({this.arguments, Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _TestPageState();
}

class _TestPageState extends NormalStatefulWidgetState<TestPage> {
  RxBool disable = false.obs;
  RxDouble borderRadius = 10.0.obs;
  Rx<Alignment> alignment = Alignment.centerLeft.obs;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(context: context, title: NormalAppBar.titleWidget('测试'));

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverListSection.staticTypeWidget(
          children: [
            AppScaleButton(
              style: AppButtonStyle.red,
              onTap: () {
                innerLoading.show().hide(afterDelay: const Duration(seconds: 2));
              },
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              child: WidgetsFactory.text('Toast - 2秒后隐藏', color: Colors.white),
            ),
            AppButton(
              style: AppButtonStyle.blue,
              onTap: () {
                showMessage('游戏年轮旨在为您打造专业的switch破解游戏下载网站,任天堂switch游戏下载,PS4游戏、ps4破解游戏,switch破解,switch国行破解,switch游戏下载、NS游戏下载,ns破解游戏资源,xci游戏下载,nsp游戏下载');
              },
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              padding: const EdgeInsets.all(15),
              child: WidgetsFactory.text('提示信息控件 - 2秒后隐藏', color: Colors.white),
            ),
            AppButton(
              style: AppButtonStyle.red,
              onTap: () {
                showCustomWidget(
                  widgetBuilder: () => Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(top: 50, bottom: 50),
                          child: Column(
                            children: [
                              WidgetsFactory.text('标题', fontSize: 30, color: Colors.red),
                              WidgetsFactory.text('自定义控件使用', fontSize: 20),
                              SafeAreaPaddingWidget.bottom(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ).addDefaultTextStyle(),
                );
              },
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              padding: const EdgeInsets.all(15),
              child: WidgetsFactory.text('提示信息自定义控件 - 2秒后隐藏', color: Colors.white),
            ),
            AppButton(
              style: AppButtonStyle.blue,
              onTap: () {
                useT<BuildContext>(
                  Get.context,
                  (d) => PageRouteEnum.itemDetails.push(d, arguments: PageArguments(arguments: {'id': Util.randomInt(max: 100).toString()})),
                );
              },
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              padding: const EdgeInsets.all(15),
              child: WidgetsFactory.text('进入商品详情页', color: Colors.white),
            ),
            AppButton(
              style: AppButtonStyle.red,
              borderRadius: 15,
              onTap: () {
                disable.value = !disable.value;
                borderRadius.value = Util.randomDouble(max: 30, min: 5);
                alignment.value = Util.randomBool ? Alignment.centerLeft : Alignment.centerRight;
              },
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              padding: const EdgeInsets.all(15),
              child: WidgetsFactory.text('修改按钮状态', color: Colors.white),
            ),
            Obx(
              () => AppButton(
                style: AppButtonStyle.blue,
                borderRadius: borderRadius.value,
                disable: disable.value,
                alignment: alignment.value,
                onTap: () => showMessage('测试按钮事件'),
                disabledChild: WidgetsFactory.text('测试按钮', color: Colors.black),
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: const EdgeInsets.all(15),
                child: WidgetsFactory.text('测试按钮', color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
