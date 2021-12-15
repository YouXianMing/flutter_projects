import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

enum AppCustomIndicatorStyle {
  normal,
  rotateRedCircle,
}

class AppCustomIndicatorWidget extends StatelessWidget {
  final AppCustomIndicatorStyle style;

  const AppCustomIndicatorWidget({Key? key, required this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case AppCustomIndicatorStyle.normal:
        return Container(
          color: Colors.transparent,
          child: Center(
            child: _normalIndicatorWidget(),
          ),
        );
      case AppCustomIndicatorStyle.rotateRedCircle:
        return Container(
          color: Colors.transparent,
          child: Center(
            child: _rotateCircleIndicatorWidget(color: Colors.red),
          ),
        );
    }
  }

  Widget _normalIndicatorWidget() {
    return SizedBox(
      width: 105,
      height: 105,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Util.image('loading-bgImage.png'),
          const CupertinoActivityIndicator(),
        ],
      ),
    );
  }

  Widget _rotateCircleIndicatorWidget({required Color color}) {
    return SizedBox(
      width: 105,
      height: 105,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Util.image('circle_bg.png'),
          AnimatedRotate(
            duration: const Duration(milliseconds: 800),
            child: SizedBox(width: 75, height: 75, child: Util.image('circle_line_rotate.png', color: color)),
          ),
          WidgetsFactory.text('POD', color: color),
          // Util.image('loading-bgImage.png'),
          // const CupertinoActivityIndicator(),
        ],
      ),
    ).addDefaultTextStyle();
  }
}
