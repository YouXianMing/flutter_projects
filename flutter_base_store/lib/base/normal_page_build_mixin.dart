import 'package:flutter/material.dart';
import 'package:flutter_base_store/widgets/app_custom_indicator_widget.dart';
import 'package:flutter_base_store/widgets/first_time_loading_custom_widget.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:project_base_libs_pkg/third_lib_get.dart';
import '../toasts/message.dart';

mixin NormalPageBuildMixin {
  /// 内部loading
  final InformationView innerLoading = InformationView(
    type: AnimatedWidgetType.simpleToast,
    waitForBuild: true,
    builder: (_) => const AppCustomIndicatorWidget(style: AppCustomIndicatorStyle.rotateRedCircle),
  );

  /// 外部loading
  final InformationView outerLoading = InformationView(
    type: AnimatedWidgetType.simpleToast,
    waitForBuild: true,
    builder: (_) => const AppCustomIndicatorWidget(style: AppCustomIndicatorStyle.rotateRedCircle),
  );

  /// Future加载控件
  final FirstTimeLoadingWidget firstTimeLoadingWidget = FirstTimeLoadingWidget(
    loadingWidgetBuilder: (_) => const FirstTimeLoadingIndicatorWidget(),
    errorWidgetBuilder: (tapToReloadCallback, _) => FirstTimeLoadingErrorReloadWidget(onPressed: tapToReloadCallback),
  );

  /// 内部StackContainer
  final StackContainer innerStackContainer = StackContainer();

  /// 外部StackContainer
  final StackContainer outerStackContainer = StackContainer();

  /// 显示toast信息
  void showMessage(String text, {Duration duration = const Duration(seconds: 2)}) {
    useT<BuildContext>(Get.overlayContext, (context) => Message.showMessageToast(context, text, duration: duration));
  }

  /// 显示自定义的widget
  void showCustomWidget({required Widget Function() widgetBuilder, Duration duration = const Duration(seconds: 2)}) {
    useT<BuildContext>(Get.overlayContext, (context) => Message.showCustomWidget(context, widgetBuilder(), duration: duration));
  }
}
