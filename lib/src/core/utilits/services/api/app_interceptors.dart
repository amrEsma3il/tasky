import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../../service_locator.dart' as di;
import '../../../../config/routing/app_routes_info/app_routes_name.dart';
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
    String? tokenInfo = sharedPreferences.getString("token_info");
    bool isAuthed = (tokenInfo == null || tokenInfo == "" || tokenInfo.isEmpty)
        ? false
        : true;

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
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    log("errorrrrrrrrrrrrrrr");
    debugPrint(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");

    if (err.response?.statusCode == 401) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? tokenInfo = preferences.getString("token_info");

      if (tokenInfo != null && tokenInfo.isNotEmpty && tokenInfo != "") {
        TokenModel authenticatedUser =
            TokenModel.fromJson(jsonDecode(tokenInfo) as Map<String, dynamic>);
        try {
          final dataState = await refreshToken(
              refreshToken: authenticatedUser.refreshToken,
              id: authenticatedUser.id);
          dataState.when(
            success: (data) async {
              RequestOptions requestOptions = err.requestOptions;
              requestOptions.headers['Authorization'] =
                  'Bearer ${authenticatedUser.accessToken}';
              try {
                final response = await client.fetch(requestOptions);
                handler.resolve(response);
              } catch (e) {
                if (kDebugMode) {
                  log("unexpected error from refresh 1: $e");
                }
                handler.reject(DioException(
                    requestOptions: requestOptions,
                    error: 'Failed after token refresh: $e'));
              }
            },
            failure: (networkExceptions) async {
              // showToast(
              //     "Network error: $networkExceptions", AppColor.softMovee);

              // handler.reject(DioException(
              //     requestOptions: err.requestOptions,
              //     error: 'Token refresh failed: $networkExceptions'));
              var dataState = await logOut();
              dataState.when(
                success: (data) {
                  sharedPreferences.setString("token_info", "");
                  Get.offAllNamed(AppRouteName.login);
                },
                failure: (networkExceptions) {
                  showToast(
                      NetworkExceptions.getErrorMessage(networkExceptions),
                      AppColor.blueBlack);
                },
              );

              // handle logout here
            },
          );
        } catch (e) {
          if (kDebugMode) {
            log("unexpected error from refresh 2: $e");
          }
          handler.reject(DioException(
              requestOptions: err.requestOptions,
              error: 'Exception during token refresh: $e'));
        }
      } else {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  

  Future<DataState<String>> refreshToken(
      {required String refreshToken, required String id}) async {
    log('------------------------------------------------------------------------');
    log("hi from refresh method");

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

  Future<DataState<bool>> logOut() async {
    try {
      TokenModel authenticatedUser = TokenModel.fromJson(
          jsonDecode(sharedPreferences.getString("token_info")!)
              as Map<String, dynamic>);
      Response response = await client.post(EndPoints.logOut,
          data: {"token": authenticatedUser.refreshToken});

      return DataState.success(response.data['success']);
    } catch (e) {
      return const DataState.failure(NetworkExceptions.unexpectedError());
    }
  }
}
