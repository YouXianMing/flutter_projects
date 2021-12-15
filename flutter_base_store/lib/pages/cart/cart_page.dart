import 'dart:async';
import 'package:flutter_base_store/headers.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class CartPage extends NormalStatefulWidget {
  final PageArguments? arguments;
  const CartPage({this.arguments, Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _CartPageState();
}

class _CartPageState extends NormalStatefulWidgetState<CartPage> {
  late StreamSubscription cartRefreshEvent;
  String title = '';
  String id = '';
  int count = 0;

  @override
  void initState() {
    super.initState();

    cartRefreshEvent = EventBusManager.getInstance.listen<CartRefreshEvent>((event) {
      title = getT(event.mark, defaultValue: '');
      id = event.itemId;
      setState(() {});
    });
  }

  @override
  void dispose() {
    cartRefreshEvent.cancel();
    super.dispose();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WidgetsFactory.text(title),
          WidgetsFactory.text(id),
        ],
      ),
    );
  }

  @override
  Widget firstTimeLoadingWidgetStartLoading(BuildContext context) {
    return firstTimeLoadingWidget.listenFuture(() => DioNetworkWith(NetURL.userCartProducts).startRequest()).onSuccess((d) {
      appPrint(d.runtimeType);
      appPrint(d);
    });
  }
}
