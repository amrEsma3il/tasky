import 'dart:convert';
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
  AppIntercepters({required this.sharedPreferences ,required this.client});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;

    bool isAuthed =
        sharedPreferences.getString("token_info") == null
            ? false
            : true;

    if (isAuthed) {
      TokenModel? authenticatedUser = TokenModel.fromJson(jsonDecode(
          sharedPreferences.getString("token_info") ??
              "") as Map<String, dynamic>);
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer${authenticatedUser.accessToken}";
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
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      bool isAuthed =
          sharedPreferences.getString("token_info") == null
              ? false
              : true;

      if (isAuthed) {
        TokenModel? authenticatedUser = TokenModel.fromJson(jsonDecode(
            sharedPreferences.getString("token_info") ??
                "") as Map<String, dynamic>);
        try {
          final dataState = await refreshToken(
              id: authenticatedUser.id,
              refreshToken: authenticatedUser.refreshToken);

          dataState.when(
            success: (data) async {
              return handler.resolve(await retry(err.requestOptions));
            },
            failure: (networkExceptions) {
              showToast(NetworkExceptions.getErrorMessage(networkExceptions),
                  AppColor.movee);
            },
          );
        } catch (e) {
          print("unexpexted error");
        }
      }
      // UserModel? authenticatedUser =
      //     await authLocalDataSource.getSavedLoginCredentials();
      // if (authenticatedUser != null) {
      // if (await _refreshToken(
      //   authenticatedUser,
      // )) {
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
      // }
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions)async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

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
      return DataState.failure(NetworkExceptions.forbidden('feailed refresh'));
    }

    // final response = await client.post(EndPoints.refreshToken, data: {
    //   AppStrings.token: authenticatedUser.token,
    //   AppStrings.refreshToken: authenticatedUser.refreshToken,
    // });
    // final jsonResponse = Commons.decodeJson(response);
    // BaseResponseModel baseResponse = BaseResponseModel.fromJson(jsonResponse);
    // if (baseResponse.isSuccess!) {
    //   authenticatedUser.token = baseResponse.data["token"];
    //   authenticatedUser.refreshToken = baseResponse.data["refreshToken"];
    //   authLocalDataSource.saveLoginCredentials(userModel: authenticatedUser);
    //   return true;
    // } else {
    //   return false;
    // }
  }
}
