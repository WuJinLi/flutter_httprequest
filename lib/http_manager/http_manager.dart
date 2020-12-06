import 'package:dio/dio.dart';
import 'package:flutter_app/http_manager/http_utils.dart';

import 'app_exceptions.dart';
import 'cache.dart';

class HttpManager {
  static void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    HttpUtils().init(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        interceptors: interceptors);
  }

  static void setHeaders(Map<String, dynamic> map) {
    HttpUtils().setHeaders(map);
  }

  static void cancelRequests({CancelToken token}) {
    HttpUtils().cancelRequests(token: token);
  }

  static Future get(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    String cacheKey,
    bool cacheDisk = false,
  }) async {
    return await HttpUtils().get(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
      refresh: refresh,
      noCache: noCache,
      cacheKey: cacheKey,
    );
  }

  static Future post(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpUtils().post(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future put(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpUtils().put(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future patch(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpUtils().patch(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future delete(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpUtils().delete(
      path,
      data: data,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  static Future postForm(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await HttpUtils().postForm(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
