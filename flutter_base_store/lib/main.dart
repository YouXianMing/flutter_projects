import 'dart:async';
import 'package:flutter_base_store/pages/tab_bar/tab_bar_page.dart';
import 'package:flutter_base_store/pages/z_others/unknown_page.dart';
import 'package:flutter_base_store/utils/app_data_init.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'headers.dart';

Future<void> main() async {
  /// 确保所有的插件都初始化好了
  WidgetsFlutterBinding.ensureInitialized();

  /// App相关数据初始化操作
  await AppDataInit.start();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
          Stack(children: [
            widget!,
          ]),
          maxWidth: double.infinity,
          minWidth: AppConstant.appScaleWidth,
          defaultScale: true,
          debugLog: true,
          breakpoints: [ResponsiveBreakpoint.resize(AppConstant.appScaleWidth, name: MOBILE)],
          background: Container(color: const Color(0xFFF5F5F5)),
        );
      },
      unknownRoute: GetPage(name: '/notFound', page: () => const UnknownPage()),
      routes: {'/': (_) => const TabBarPage()},
      translations: AppTranslations(),
      locale: AppLanguage.english.locale,
      onGenerateRoute: (settings) {
        PageRouteEnum? routePage = pageRouteEnumFromName(settings.name ?? '');
        if (routePage != null) return routePage.getMaterialPageRouteFromSetting(settings);
        return null;
      },
      routingCallback: (routing) {
        appPrint("上一个界面: ${routing?.previous ?? "空"} 当前界面: ${routing?.current ?? "空"}");
      },
    );
  }
}
