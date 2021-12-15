import 'package:flutter_base_store/headers.dart';
import 'package:flutter_base_store/pages/cart/cart_page.dart';
import 'package:flutter_base_store/pages/category/category_page.dart';
import 'package:flutter_base_store/pages/home/home_page.dart';
import 'package:flutter_base_store/pages/tab_bar/widgets/tab_bar_button_view.dart';
import 'package:flutter_base_store/pages/tab_bar/widgets/tar_bar_button.dart';
import 'package:flutter_base_store/pages/user/user_page.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';

class TabBarPage extends NormalStatefulWidget {
  final PageArguments? arguments;
  const TabBarPage({Key? key, this.arguments}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => TabBarPageState();
}

class TabBarPageState extends NormalStatefulWidgetState<TabBarPage> {
  Key key = UniqueKey();
  final PageViewManager pageViewManager = PageViewManager();
  final List pages = [const HomePage(), const CategoryPage(), const CartPage(), const UserPage()];

  void resetPages() {
    key = UniqueKey();
  }

  @override
  void initState() {
    super.initState();
    appPrint('🔵屏幕宽高:${Get.width}:${Get.height}🔵');
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                /// 页面
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: pageViewManager.buildPageView(itemBuilder: (context, index) => pages[index], itemCount: pages.length),
                  ),
                ),

                /// 线条
                Container(height: 0.5, color: Colors.grey.withOpacity(0.5)),

                /// 底部按钮
                Container(
                  color: Colors.white,
                  child: SafeArea(top: false, child: SizedBox(height: 49, child: TabBarButtonView(canTap: canTap, didTap: didTap))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool canTap(TabBarButton button) {
    return true;
  }

  void didTap(TabBarButton button) {
    pageViewManager.makeSelectIndex(button.index);
  }
}
