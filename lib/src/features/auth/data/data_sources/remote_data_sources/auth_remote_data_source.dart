import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utilits/services/api/dio_consumer.dart';
import '../../../../../core/utilits/services/api/end_points.dart';
import '../../models/login/login_request_entity.dart';
import '../../models/login/token_model.dart';
import '../../models/profile_model.dart';
import '../../models/user_model.dart';

class AuthRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;
  AuthRemoteDataSource(this.sharedPreferences, {required this.dioConsumer});

  Future<TokenModel> login({
    required String phone,
    required String password,
  }) async {
    return TokenModel.fromJson(await dioConsumer.post(EndPoints.login,
            body: LoginModel(password: password, phone: phone).toJson())
        as Map<String, dynamic>);
  }

  Future<TokenModel> register(UserModel user) async {
    Map<String, dynamic> response =
        await dioConsumer.post(EndPoints.register, body: user.toJson());
    return TokenModel.fromJson(response);
  }

  Future<ProfileModel> profile() async {
    Map<String, dynamic> response = await dioConsumer.get(EndPoints.profile);

    return ProfileModel.fromJson(response);
  }

  Future<bool> logOut() async {
    TokenModel authenticatedUser = TokenModel.fromJson(
        jsonDecode(sharedPreferences.getString("token_info")!)
            as Map<String, dynamic>);
    Map<String, dynamic> response = await dioConsumer.post(EndPoints.logOut,
        body: {"token": authenticatedUser.refreshToken});

    return response['success'];
  }
}
