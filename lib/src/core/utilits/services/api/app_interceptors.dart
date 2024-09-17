import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../../service_locator.dart' as di;
import '../../../../features/auth/data/models/login/token_model.dart';
import '../../../constants/colors.dart';
import '../../../data_state/api_result.dart';
import '../../../errors/network_exceptions.dart';
import '../../functions/toast_message.dart';
import 'end_points.dart';

class AppIntercepters extends Interceptor {
  final Dio client;
  final SharedPreferences sharedPreferences;
  AppIntercepters({required this.sharedPreferences, required this.client});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;

    bool isAuthed =
        sharedPreferences.getString("token_info") == null ? false : true;

    log(isAuthed.toString());

    if (isAuthed) {
      TokenModel? authenticatedUser = TokenModel.fromJson(
          jsonDecode(sharedPreferences.getString("token_info") ?? "")
              as Map<String, dynamic>);
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer ${authenticatedUser.accessToken}";
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

   @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    log("errorrrrrrrrrrrrrrr");
    debugPrint("ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");

    if (err.response?.statusCode == 401) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? tokenInfo = preferences.getString("token_info");

      if (tokenInfo != null) {
        TokenModel authenticatedUser = TokenModel.fromJson(jsonDecode(tokenInfo) as Map<String, dynamic>);
        try {
          final dataState = await refreshToken(refreshToken: authenticatedUser.refreshToken, id: authenticatedUser.id);
          dataState.when(
            success: (data) async {
              RequestOptions requestOptions = err.requestOptions;
              requestOptions.headers['Authorization'] = 'Bearer ${authenticatedUser.accessToken}';
              try {
                final response = await client.fetch(requestOptions);
                handler.resolve(response);
              } catch (e) {
                handler.reject(DioException(requestOptions: requestOptions, error: 'Failed after token refresh: $e'));
              }
            },
            failure: (networkExceptions) {
              showToast("Network error: $networkExceptions",AppColor.movee.withOpacity(0.2));
              handler.reject(DioException(requestOptions: err.requestOptions, error: 'Token refresh failed: $networkExceptions'));
            },
          );
        } catch (e) {
          if (kDebugMode) {
            print("unexpected error: $e");
          }
          handler.reject(DioException(requestOptions: err.requestOptions, error: 'Exception during token refresh: $e'));
        }
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
    super.onError(err, handler);
  }



  // Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return client.request<dynamic>(requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options);
  // }

  Future<DataState<String>> refreshToken(
      {required String refreshToken, required String id}) async {
    try {
      final response = await client.get(EndPoints.refreshToken,
          queryParameters: {'token': refreshToken});
      sharedPreferences.setString(
          "token_info",
          jsonEncode(TokenModel(
                  id: id,
                  refreshToken: refreshToken,
                  accessToken: response.data['access_token'])
              .toJson()));
      return const DataState.success("");
    } catch (e) {
      return const DataState.failure(
          NetworkExceptions.forbidden('feailed refresh'));
    }
  }
}
