import 'package:flutter_base_store/headers.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class TemplatePage extends NormalStatefulWidget {
  final PageArguments? arguments;
  const TemplatePage({this.arguments, Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _TemplatePageState();
}

class _TemplatePageState extends NormalStatefulWidgetState<TemplatePage> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(context: context, title: NormalAppBar.titleWidget('标题'));

  @override
  Widget body(BuildContext context) {
    return Container();
  }

  @override
  Widget firstTimeLoadingWidgetStartLoading(BuildContext context) {
    return firstTimeLoadingWidget.setDone();
  }
}
