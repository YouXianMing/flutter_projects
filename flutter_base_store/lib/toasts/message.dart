import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class Message {
  static void showMessageToast(BuildContext context, String text, {Duration duration = const Duration(seconds: 2)}) {
    InformationView(
      type: AnimatedWidgetType.simpleToast,
      waitForBuild: true,
      // debugPrintInfo: true,
      data: text,
    )
        .managerMaybePopEvent()
        .inOverlay(context)
        .setWidgetBuilder((v) => _messageToastContentWidget(v.data as String))
        .show()
        .hide(afterDelay: duration);
  }

  static Widget _messageToastContentWidget(String text) {
    return Container(
      color: Colors.black.withOpacity(0.1),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.black.withOpacity(0.86),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 260),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ).addDefaultTextStyle(),
          ),
        ),
      ),
    );
  }

  static void showCustomWidget(BuildContext context, Widget widget, {Duration duration = const Duration(seconds: 2)}) {
    InformationView(
      type: AnimatedWidgetType.simpleToast,
      waitForBuild: true,
      // debugPrintInfo: true,
      data: widget,
    )
        .managerMaybePopEvent()
        .inOverlay(context)
        .setWidgetBuilder((v) => _customWidgetContentWidget(v.data as Widget))
        .show()
        .hide(afterDelay: duration);
  }

  static Widget _customWidgetContentWidget(Widget widget) {
    return Container(color: Colors.black.withOpacity(0.1), child: widget);
  }
}
