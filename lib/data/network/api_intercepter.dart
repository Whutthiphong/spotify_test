import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_test/constant/constants.dart';
import 'package:spotify_test/di/injection_init.dart';
import 'package:spotify_test/models/login_token_model.dart';
import 'package:spotify_test/repo/spotify_repo_impl.dart';

class ApiInterceptors implements InterceptorsWrapper {
  final Dio dio;

  ApiInterceptors(this.dio);

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    print(err);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    dio2curl(err.requestOptions);
    if (err.response?.statusCode == 401) {
      LoginTokenModel? resp = await getIt.get<SpotifyRepoImpl>().loginToken();
      prefs.setString(Constant.prefsAccessToken, resp?.accessToken ?? "");
      prefs.setString(Constant.prefsTokenType, resp?.tokenType ?? "");
      prefs.reload();

      RequestOptions options = err.response!.requestOptions;
      options.headers["Authorization"] =
          "${resp?.tokenType} ${resp?.accessToken}";
      dio.fetch(options).then(
        (r) => handler.resolve(r),
        onError: (e) {
          handler.reject(e);
        },
      );
    }
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString(Constant.prefsAccessToken) ?? "";
    String? tokenType = prefs.getString(Constant.prefsTokenType);

    options.baseUrl = Constant.baseUrl;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = '$tokenType $accessToken';
      options.headers['Content-Type'] = 'application/json';
    }

    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}

dio2curl(RequestOptions requestOption) {
  var curl = '';

  // Add PATH + REQUEST_METHOD
  curl +=
      'curl --request ${requestOption.method} \'${requestOption.baseUrl}${requestOption.path}\'';

  // Include headers
  for (var key in requestOption.headers.keys) {
    curl += ' -H \'$key: ${requestOption.headers[key]}\'';
  }

  // Include data if there is data
  if (requestOption.data != null) {
    curl += ' --data-binary \'${requestOption.data}\'';
  }

  curl += ' --insecure'; //bypass https verification
  print("-------- cURL --------");
  print(curl);
  print("----------------------");
}

_printErrorData(DioError err) {
  print(
      "<--${err.response?.statusCode ?? '' + " : "}  ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL')}");
  print("${err.response != null ? err.response!.data : 'Unknown Error'}");
  print("<-- End error");
}
