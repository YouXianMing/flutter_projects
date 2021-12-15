import 'package:project_base_libs_pkg/base/managers/event_bus_manager.dart';

/// 购物车刷新事件
class CartRefreshEvent extends AppBaseEvent {
  @override
  String? mark;

  final String itemId;

  CartRefreshEvent({this.mark, required this.itemId});
}
