import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_test/data/network/api_intercepter.dart';

@injectable
class ApiProvider {
  final Dio _dio = Dio();

  ApiProvider() {
    _dio.interceptors.clear();
    _dio.interceptors.add(ApiInterceptors(_dio));

    // ignore: deprecated_member_use
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        if (kDebugMode) {
          // Accept it only in debug mode.
          return true;
        }
        return false;
      };
      return null;
    };
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    try {
      Response res = await _dio.get(path,
          queryParameters: queryParameters,
          data: body != null ? jsonEncode(body) : null);

      return res;
    } on DioException catch (err) {
      throw Exception(err);
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? body}) async {
    try {
      Response res = await _dio.post(path, data: jsonEncode(body));

      return res;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
