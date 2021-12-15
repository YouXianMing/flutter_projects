import 'package:flutter_base_store/headers.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class CategoryPage extends NormalStatefulWidget {
  final PageArguments? arguments;
  const CategoryPage({this.arguments, Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _CategoryPageState();
}

class _CategoryPageState extends NormalStatefulWidgetState<CategoryPage> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
