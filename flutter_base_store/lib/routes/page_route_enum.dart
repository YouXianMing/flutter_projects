import 'package:flutter/material.dart';
import 'package:flutter_base_store/pages/cart/cart_page.dart';
import 'package:flutter_base_store/pages/category/category_page.dart';
import 'package:flutter_base_store/pages/home/home_page.dart';
import 'package:flutter_base_store/pages/item_details/item_details_page.dart';
import 'package:flutter_base_store/pages/tab_bar/tab_bar_page.dart';
import 'package:flutter_base_store/pages/z_others/test_page.dart';
import 'package:flutter_base_store/pages/user/user_page.dart';

enum PageRouteEnum {
  /// tabBar
  tabBar,

  /// 首页
  home,

  /// 类目页
  category,

  /// 购物车
  cart,

  /// 个人中心
  user,

  /// 商品详情
  itemDetails,

  /// 测试页面
  test,
}

// pageRouteEnum的准备操作,请放在main里
void pageRouteEnumPrepare() {
  for (var value in PageRouteEnum.values) {
    value._storeValueToMap();
  }
}

// 根据路由名字转化成enum值
PageRouteEnum? pageRouteEnumFromName(String name) => _stringEnumMap[name];

extension PageRouteEnumExtension on PageRouteEnum {
  // 将枚举值转换成对应的routeName
  String get routeName => _enumStringMap[this] ?? '';

  // 将appSetting转化为对应的MaterialPageRoute
  MaterialPageRoute getMaterialPageRouteFromSetting(RouteSettings settings) {
    dynamic arguments = settings.arguments;
    switch (this) {
      case PageRouteEnum.tabBar:
        return MaterialPageRoute(settings: settings, builder: (_) => TabBarPage(arguments: arguments));
      case PageRouteEnum.home:
        return MaterialPageRoute(settings: settings, builder: (_) => HomePage(arguments: arguments));
      case PageRouteEnum.cart:
        return MaterialPageRoute(settings: settings, builder: (_) => CartPage(arguments: arguments));
      case PageRouteEnum.user:
        return MaterialPageRoute(settings: settings, builder: (_) => UserPage(arguments: arguments));
      case PageRouteEnum.itemDetails:
        return MaterialPageRoute(settings: settings, builder: (_) => ItemDetailsPage(arguments: arguments));
      case PageRouteEnum.category:
        return MaterialPageRoute(settings: settings, builder: (_) => CategoryPage(arguments: arguments));
      case PageRouteEnum.test:
        return MaterialPageRoute(settings: settings, builder: (_) => TestPage(arguments: arguments));
    }
  }

  // pushName的调用
  Future push(BuildContext context, {dynamic arguments}) => Navigator.pushNamed(context, routeName, arguments: arguments);

  // 将需要的一些值存储到map中
  void _storeValueToMap() {
    String pageRouteName = '';

    switch (this) {
      case PageRouteEnum.tabBar:
        pageRouteName = _pageRouteNameFrom(TabBarPage);
        break;
      case PageRouteEnum.home:
        pageRouteName = _pageRouteNameFrom(HomePage);
        break;
      case PageRouteEnum.cart:
        pageRouteName = _pageRouteNameFrom(CartPage);
        break;
      case PageRouteEnum.user:
        pageRouteName = _pageRouteNameFrom(UserPage);
        break;
      case PageRouteEnum.itemDetails:
        pageRouteName = _pageRouteNameFrom(ItemDetailsPage);
        break;
      case PageRouteEnum.category:
        pageRouteName = _pageRouteNameFrom(CategoryPage);
        break;
      case PageRouteEnum.test:
        pageRouteName = _pageRouteNameFrom(TestPage);
        break;
    }

    _stringEnumMap[pageRouteName] = this;
    _enumStringMap[this] = pageRouteName;
  }
}

String _pageRouteNameFrom(var className) => '/' + className.toString();
late Map<String, PageRouteEnum> _stringEnumMap = {};
late Map<PageRouteEnum, String> _enumStringMap = {};
