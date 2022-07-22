import 'dart:io';
import 'package:project_base_libs_pkg/third_lib_dio_adapter.dart';
import 'package:flutter_base_store/headers.dart';
import 'package:flutter_base_store/networks/proxy_ip.dart';
import 'package:project_base_libs_pkg/base_file_headers.dart';
import 'package:project_base_libs_pkg/third_lib_dio.dart' as dio;

extension DioNetworkExtension on BaseNetwork {
  void _loadingWidgetShow(dynamic loadingWidget) {
    if (loadingWidget != null && loadingWidget is InformationView) {
      loadingWidget.show();
    }
  }

  void _loadingWidgetHide(dynamic loadingWidget) {
    if (loadingWidget != null && loadingWidget is InformationView) {
      loadingWidget.hide();
    }
  }

  void _printDebugInfo() {
    // debug信息
    if (AppConstant.enableNetworkDebugInfo && debugInfo != null && debugInfo is NetURL) {
      NetURL netURL = debugInfo;
      String str = '------------------------------------------------------\n';
      str += '${netURL.method == NetworkMethod.get ? '📶 [GET] ' : '📶 [POST] '}${netURL.info}\n';
      str += '${netURL.url}\n';
      if (headers != null) {
        str += '请求头部: $headers\n';
      }
      if (parameters != null) {
        str += '请求参数: $parameters\n';
      }
      str += '\n';

      // ignore: avoid_print
      print(str);
    }
  }

  void startRequestAndListen(
      {Function(ResultModel, BaseNetwork)? onSuccess, Function(ResultModel, BaseNetwork)? onError, dynamic loadingWidget}) {
    // 显示菊花
    _loadingWidgetShow(loadingWidget);
    startRequest().then((value) {
      // 隐藏菊花
      _loadingWidgetHide(loadingWidget);
      if (onSuccess != null) onSuccess(value, this);
    }, onError: (e) {
      // 隐藏菊花
      _loadingWidgetHide(loadingWidget);
      if (onError != null) onError(e, this);
    });
  }
}

class NetworkResultDataTransform extends BaseNetworkResultTransform {
  @override
  Future successDataTransform(dynamic data, BaseNetwork network) {
    // 对dio的response数据进行加工
    dio.Response response = data;
    if (response.data is Map<String, dynamic>) {
      ResultModel resultModel = ResultModel.fromJson(response.data);
      if (resultModel.resultStatus == ResultStatus.success) {
        return Future.value(resultModel);
      } else {
        // code码不为200的返回结果
        return Future.error(resultModel);
      }
    } else {
      // 如果数据格式不是map结构,则认为返回数据异常
      return Future.error(ResultModel(msg: 'Data format error', code: 8888887));
    }
  }

  @override
  Future errorDataTransform(dynamic data, BaseNetwork network) {
    return Future.error(ResultModel(msg: 'Network error', code: 8888888));
  }
}

class RequestCallback extends BaseRequestCallback {
  @override
  void startRequestCallback(BaseNetwork network) => network._printDebugInfo();
}

// ignore: non_constant_identifier_names
DioNetwork DioNetworkWith(NetURL netURL) {
  DioNetwork dioNetwork = DioNetwork(
    config: NetworkConfig(),
    url: netURL.url,
    method: netURL.method,
  );

  // 返回结果转换为Model
  dioNetwork.resultDataTransform = NetworkResultDataTransform();

  // 如果是测试环境,则开启网络请求打印信息
  if (AppConstant.isProductEnvironment == false) {
    // 请求开始结束时的回调对象(此处用于debug信息用)
    dioNetwork.requestCallback = RequestCallback();

    // 获取debug信息
    dioNetwork.debugInfo = netURL;
  }

  // 设置请求头
  // dioNetwork.setHeaders({});

  return dioNetwork;
}

class NetworkConfig extends DioNetworkConfig {
  @override
  void startConfig(object) {
    super.startConfig(object);
    if (AppConstant.isProductEnvironment != true && AppConstant.useProxyIp) {
      if (PlatFormInfo.isIOS) {
        addiOSProxy(object['dio']);
      } else if (PlatFormInfo.isAndroid) {
        addAndroidProxy(object['dio']);
      }
    }
  }

  /// 设置Android抓包代理
  void addAndroidProxy(dio.Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      client.findProxy = (uri) => androidProxyIpString;
      return null;
    };
  }

  /// 设置iOS抓包代理
  void addiOSProxy(dio.Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      client.findProxy = (uri) => iOSProxyIpString;
      return null;
    };
  }
}
