import 'package:flutter_base_store/headers.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class UserPage extends NormalStatefulWidget {
  final PageArguments? arguments;
  const UserPage({this.arguments, Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _UserPageState();
}

class _UserPageState extends NormalStatefulWidgetState<UserPage> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Stack(
      children: [
        Container(color: ([...Colors.primaries]..shuffle()).first),
        Positioned(top: 0, bottom: 0, left: 0, right: 0, child: Util.image('你中奖啦.png')),
      ],
    );
  }

  @override
  Widget firstTimeLoadingWidgetStartLoading(BuildContext context) {
    return firstTimeLoadingWidget.listenFuture(() => Future.delayed(const Duration(seconds: 2), () {})).onSuccess((d) {});
  }
}
