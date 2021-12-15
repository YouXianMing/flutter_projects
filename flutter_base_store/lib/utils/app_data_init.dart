import 'package:flutter_base_store/routes/page_route_enum.dart';
import 'package:project_base_libs_pkg/base/tools/sp_val.dart';

class AppDataInit {
  static Future start() async {
    // spVal的初始化
    await SpVal.initialized();

    // pageRouteEnum的准备操作
    pageRouteEnumPrepare();
  }
}
