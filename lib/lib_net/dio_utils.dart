import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:luck_pets/lib_config/Config.dart';
import 'base_response.dart';
/*
 * @author chengpenggao
 * @date 2019/11/3
 */

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
}

//http 请求的信息
class HttpConfig {
  String status;
  String code;
  String msg;
  String data;

  /// Options.
  BaseOptions options;

  HttpConfig({this.status, this.code, this.data, this.msg, this.options});
}

///网络请求
class HttpDioUtils {
  static HttpDioUtils instance;
  static Dio _dio;
  BaseOptions _options = getOptions();

  /// BaseResp [String status]字段 key, 默认：status.
  String _statusKey = "status";

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String _codeKey = "code";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String _msgKey = "msg";

  /// BaseResp [T data]字段 key, 默认：data.
  String _dataKey = "data";

  /// 是否是debug模式.
  static bool _isDebug = false;

  static HttpDioUtils getInstance() {
    if (instance == null) {
      instance = new HttpDioUtils();
      print("dio1");
    }
    return instance;
  }

  HttpDioUtils() {
    print("dio");
    _dio = new Dio(_options);
  }
  ///设置cookie
  void setCookie(String cookie) {
    Map<String, dynamic> _headers = Map();
    _headers['Cookie'] = cookie;
    _dio.options.headers.addAll(_headers);
  }
  Future<BaseResponse<T>> request<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    // 打印网络日志
    StringBuffer requestParam = new StringBuffer();
    requestParam.write(" [request: method] ");
    requestParam.write(method);
    requestParam.write("\n");
    requestParam.write(" [request: url] ");
    requestParam.write(_dio.options.baseUrl);
    requestParam.write("\n");
    requestParam.write("[request: path] ");
    requestParam.write(path);
    requestParam.write("\n");
    requestParam.write("[request: headers]");
    requestParam.write(_dio.options.headers);
    requestParam.write("\n");
    requestParam.write("[request: params] ");
    requestParam.write(json.encode(data));

    printLog(requestParam.toString());

    ///网络请求前
    Response response = await _dio.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    _printHttpLog(response);
    String _status;
    int _code;
    String _msg;
    T _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        if (response.data is Map) {
          _status = (response.data[_statusKey] is int)
              ? response.data[_statusKey].toString()
              : response.data[_statusKey];
          _code = (response.data[_codeKey] is String)
              ? int.tryParse(response.data[_codeKey])
              : response.data[_codeKey];
          _msg = response.data[_msgKey];
          _data = response.data[_dataKey];
        } else {
          Map<String, dynamic> _dataMap = _decodeData(response);
          _status = (_dataMap[_statusKey] is int)
              ? _dataMap[_statusKey].toString()
              : _dataMap[_statusKey];
          _code = (_dataMap[_codeKey] is String)
              ? int.tryParse(_dataMap[_codeKey])
              : _dataMap[_codeKey];
          _msg = _dataMap[_msgKey];
          _data = _dataMap[_dataKey];
        }
        return new BaseResponse(_status, _code, _msg, _data);
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      type: DioErrorType.RESPONSE,
    ));
  }

  /// set Config.
  void setConfig(HttpConfig config) {
    _statusKey = config.status ?? _statusKey;
    _codeKey = config.code ?? _codeKey;
    _msgKey = config.msg ?? _msgKey;
    _dataKey = config.data ?? _dataKey;
    _mergeOption(config.options);
    if (_dio != null) {
      _dio.options = _options;
    }
  }

  /// merge Option.
  void _mergeOption(BaseOptions opt) {
    _options.method = opt.method ?? _options.method;
    _options.headers = (new Map.from(_options.headers))..addAll(opt.headers);
    _options.baseUrl = opt.baseUrl ?? _options.baseUrl;
    _options.connectTimeout = opt.connectTimeout ?? _options.connectTimeout;
    _options.receiveTimeout = opt.receiveTimeout ?? _options.receiveTimeout;
    _options.responseType = opt.responseType ?? _options.responseType;
    _options.extra = (new Map.from(_options.extra))..addAll(opt.extra);
    _options.contentType = opt.contentType ?? _options.contentType;
    _options.validateStatus = opt.validateStatus ?? _options.validateStatus;
    _options.followRedirects = opt.followRedirects ?? _options.followRedirects;
  }

  /// decode response data.
  Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data.toString().isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }

  /// print Http Log.
  void _printHttpLog(Response response) {
    if (_isDebug) {
      return;
    }
    try {
      print("----------------Http Log----------------" +
          "\n[statusCode]:   " +
          response.statusCode.toString() +
          "\n[request   ]:   " +
          _getOptionsStr(response.request));
      _printDataStr("reqdata ", response.request.data);
      _printDataStr("response", response.data);
    } catch (ex) {
      print("Http Log" + " error......");
    }
  }

  static void printLog(String log, {tag}) {
    bool print = true;
    if (print) {
      String tagLog;
      if (tag != null) {
        tagLog = tag + log;
      } else {
        tagLog = log;
      }
      debugPrint(tagLog);
    }
  }

  /// get Options Str.
  String _getOptionsStr(RequestOptions request) {
    return "method: " +
        request.method +
        "  baseUrl: " +
        request.baseUrl +
        "  path: " +
        request.path;
  }

  /// print Data
  void _printDataStr(String tag, Object value) {
    String da = value.toString();
    while (da.isNotEmpty) {
      if (da.length > 512) {
        print("[$tag  ]:   " + da.substring(0, 512));
        da = da.substring(512, da.length);
      } else {
        print("[$tag  ]:   " + da);
        da = "";
      }
    }
  }

  /// check Options.
  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }

  ///options
  static BaseOptions getOptions() {
    BaseOptions options = new BaseOptions(
      baseUrl: Config.BASE_URL,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );
    return options;
  }
}
