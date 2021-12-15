import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

enum ResultStatus {
  /// 200
  success,

  /// 10004
  notLogin,

  /// 未添加的状态码
  unknownError,

  /////////////////////////////////////////

  /// 8888888 网络错误
  networkError,

  /// 8888887 返回数据格式问题
  dataFormatError,

  /// code为空
  codeIsEmpty,
}

class ResultModel {
  ResultModel({this.code, this.msg, this.data});

  factory ResultModel.fromJson(Map<String, dynamic> jsonRes) => ResultModel(
        code: asT<int?>(jsonRes['code']),
        msg: asT<Object?>(jsonRes['msg']),
        data: jsonRes['data'],
      );

  /// 状态码
  int? code;

  /// 提示信息
  Object? msg;

  /// 数据
  dynamic data;

  /// 获取当前的请求状态
  ResultStatus get resultStatus {
    if (code != null) {
      if (code == 200) {
        return ResultStatus.success;
      } else if (code == 10004) {
        return ResultStatus.notLogin;
      } else if (code == 8888888) {
        return ResultStatus.networkError;
      } else if (code == 8888887) {
        return ResultStatus.dataFormatError;
      } else {
        return ResultStatus.unknownError;
      }
    } else {
      return ResultStatus.codeIsEmpty;
    }
  }

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'code': code, 'msg': msg, 'data': data};

  ResultModel clone() => ResultModel.fromJson(asT<Map<String, dynamic>>(jsonDecode(jsonEncode(this)))!);
}
