import 'dart:ui';
import 'package:project_base_libs_pkg/base/tools/sp_val.dart';

////////////////////////////////////////////////////////

/// 本地语言的枚举值
enum AppLanguage {
  english,
  chinese,
  arabs,
}

/// 当前App的类型
enum CurrentApp {
  appA,
  appB,
}

/// 本地存储的string类型数据,没有赋值的情形默认值是''
enum AppString {
  userId,
  info,
}

/// 本地存储的Int类型数据,没有赋值的情形默认值是0
enum AppInt {
  userAge,
}

/// 本地存储的Double类型数据,没有赋值的情形默认值是0.0
enum AppDouble {
  score,
}

/// 本地存储的Bool类型数据,没有赋值的情形默认值是false
enum AppBool {
  isFirstLaunch,
}

////////////////////////////////////////////////////////

/// 本地语言的枚举值扩展
extension AppLanguageExtension on AppLanguage {
  // 根据枚举值获取本地语言
  Locale get locale {
    switch (this) {
      case AppLanguage.english:
        return const Locale('en', 'US');
      case AppLanguage.chinese:
        return const Locale('zh', 'CN');
      case AppLanguage.arabs:
        return const Locale('ar', 'AE');
    }
  }
}

/// 本地存储的string类型数据扩展
extension AppStringExtension on AppString {
  String get value => SpVal.get(SpString(key: toString()));
  set value(String val) => SpVal.set(SpString(key: toString(), value: val));
}

/// 本地存储的int类型数据扩展
extension AppIntExtension on AppInt {
  int get value => SpVal.get(SpInt(key: toString()));
  set value(int val) => SpVal.set(SpInt(key: toString(), value: val));
}

/// 本地存储的double类型数据扩展
extension AppDoubleExtension on AppDouble {
  double get value => SpVal.get(SpDouble(key: toString()));
  set value(double val) => SpVal.set(SpDouble(key: toString(), value: val));
}

/// 本地存储的bool类型数据扩展
extension AppBoolExtension on AppBool {
  bool get value => SpVal.get(SpBool(key: toString()));
  set value(bool val) => SpVal.set(SpBool(key: toString(), value: val));
}
