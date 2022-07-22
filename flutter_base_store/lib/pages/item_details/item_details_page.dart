import 'package:flutter_base_store/headers.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';

class ItemDetailsPage extends NormalStatefulWidget {
  final PageArguments? arguments;

  const ItemDetailsPage({this.arguments, Key? key}) : super(key: key);

  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createWidgetState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends NormalStatefulWidgetState<ItemDetailsPage> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => NormalAppBar(context: context, title: NormalAppBar.titleWidget('商品详情页'));

  @override
  Widget body(BuildContext context) {
    Map map = getT<Map>(widget.arguments?.arguments, defaultValue: {'id': '0'});

    return Stack(
      children: [
        SizedBox(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WidgetsFactory.text('id: ${map['id']}', fontSize: 30, color: Colors.black),
                AppButton(
                  style: AppButtonStyle.blue,
                  onTap: () => innerLoading.show().hide(afterDelay: const Duration(seconds: 2)),
                  width: 200,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  child: WidgetsFactory.text('内部菊花', fontSize: 20, color: Colors.white),
                ),
                AppButton(
                  style: AppButtonStyle.blue,
                  onTap: () => outerLoading.show().hide(afterDelay: const Duration(seconds: 2)),
                  width: 200,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  child: WidgetsFactory.text('外部菊花', fontSize: 20, color: Colors.white),
                ),
                AppButton(
                  style: AppButtonStyle.blue,
                  onTap: () {
                    // 当做类方法使用
                    DioNetworkWith(NetURL.userCartProducts).startRequestAndListen(
                        loadingWidget: innerLoading,
                        onSuccess: (d, n) {
                          appPrintWarning(d);
                          appPrintWarning(d.runtimeType);
                        },
                        onError: (d, n) {
                          appPrintError(d);
                          appPrintError(d.runtimeType);
                        });
                  },
                  width: 200,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  child: WidgetsFactory.text('网络请求', fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              AppButton(
                style: AppButtonStyle.red,
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                borderRadius: 10,
                onTap: () {
                  String itemId = Util.randomInt(min: 1000000000, max: 2000000000).toString();
                  showMessage('$itemId\n加入购物车成功');
                  EventBusManager.getInstance.fire(CartRefreshEvent(itemId: itemId, mark: '商品详情页加购'));
                },
                child: WidgetsFactory.text('添加购物车', fontSize: 18, color: Colors.white),
              ),
              SafeAreaPaddingWidget.bottom(backgroundColor: Colors.transparent),
            ],
          ),
        ),
      ],
    );
  }
}
