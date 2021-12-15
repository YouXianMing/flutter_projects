import 'package:project_base_libs_pkg/base/network/base_network.dart';

class NetURL {
  static String _baseURL = 'http://rap2.test.yidianshihui.com:38080/app/mock/33';

  /// 更新baseURL
  static void updateBaseURL(String newBaseURL) {
    _baseURL = newBaseURL;
  }

  /////////////////////////////////////////////////////////////

  /// 接口描述信息
  String info;

  /// 请求类型
  NetworkMethod method;

  /// url
  String url;

  NetURL({required this.method, required this.url, required this.info});

  /////////////////////////////////////////////////////////////

  static NetURL get userCartProducts {
    return NetURL(
      info: '购物车列表',
      method: NetworkMethod.get,
      url: _baseURL + '/user/cart/products',
    );
  }
}
