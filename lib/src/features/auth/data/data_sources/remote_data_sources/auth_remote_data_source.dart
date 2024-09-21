
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utilits/services/api/dio_consumer.dart';
import '../../../../../core/utilits/services/api/end_points.dart';
import '../../models/login/login_request_entity.dart';
import '../../models/login/token_model.dart';

class AuthRemoteDataSource {
  final DioConsumer dioConsumer;
final SharedPreferences sharedPreferences;
  AuthRemoteDataSource(this.sharedPreferences, {required this.dioConsumer});

 Future<TokenModel> login({required String phone,required String password,})async{
return TokenModel.fromJson(await dioConsumer.post(EndPoints.login,body:UserModel(password: password,phone: phone).toJson() ) as Map<String, dynamic> );
  }

  register(){
//

  }
  Future<bool> logOut()async{

     TokenModel authenticatedUser = TokenModel.fromJson(
          jsonDecode(sharedPreferences.getString("token_info")! )
              as Map<String, dynamic>);
    Map<String, dynamic> response=await dioConsumer.post(EndPoints.logOut,body: {"token": authenticatedUser.refreshToken});

    return response['success'];
  }

  // Future<DataState<String>> refreshToken(
  //     {required String refreshToken, required String id}) async {
  //   try {
  //     final response = await client.get(EndPoints.refreshToken,
  //         queryParameters: {'token': refreshToken});
  //     sharedPreferences.setString(
  //         "token_info",
  //         jsonEncode(TokenModel(
  //                 id: id,
  //                 refreshToken: refreshToken,
  //                 accessToken: response.data['access_token'])
  //             .toJson()));
  //     return const DataState.success("");
  //   } catch (e) {
  //     return const DataState.failure(
  //         NetworkExceptions.forbidden('feailed refresh'));
  //   }
  // }
}