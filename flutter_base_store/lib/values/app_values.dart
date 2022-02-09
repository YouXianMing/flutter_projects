import 'app_enums.dart';

////////////////////////////////////////////////////////

/// 常量数据(只读)
class AppConstant {
  static String get secretKey {
    switch (AppConstant.app) {
      case CurrentApp.appA:
        return 'APP_A_XXXXXXXXX';

      case CurrentApp.appB:
        return 'APP_B_XXXXXXXXX';
    }
  }

  /// 当前的app
  static CurrentApp get app {
    //TODO 读取本地设置后返回当前的app值
    return CurrentApp.appA;
  }

  /// app最小缩放宽度
  static double get appScaleWidth => 370.0;

  /// 是否开启网络请求打印信息
  static bool get enableNetworkDebugInfo => true;

  /// 是否是生产环境
  static bool get isProductEnvironment => const bool.fromEnvironment('dart.vm.product');

  /// 是否使用代理
  static bool get useProxyIp => false;
}

////////////////////////////////////////////////////////

/// 数据
class AppValue {
  // app版本号
  static String appVersion = '';
}
