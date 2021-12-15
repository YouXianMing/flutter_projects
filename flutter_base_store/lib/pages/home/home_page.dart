import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:flutter_base_store/headers.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class HomePage extends NormalStatefulWidget {
  final PageArguments? arguments;
  const HomePage({this.arguments, Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _HomePageState();
}

class _HomePageState extends NormalStatefulWidgetState<HomePage> {
  RxBool disable = false.obs;
  RxDouble borderRadius = 10.0.obs;
  Rx<Alignment> alignment = Alignment.centerLeft.obs;

  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(
        context: context,
        title: NormalAppBar.titleWidget('首页'),
        hideBackButton: true,
      );

  @override
  Widget body(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverListSection.staticTypeWidget(
          children: [
            AppScaleButton(
              style: AppButtonStyle.blue,
              onTap: () => PageRouteEnum.test.push(context),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              child: WidgetsFactory.text('测试页', color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
