import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data_state/api_result.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../data_sources/remote_data_sources/auth_remote_data_source.dart';
import '../models/login/token_model.dart';
// import '../../../../../service_locator.dart'as di;
class AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
final SharedPreferences sharedPreferences;
  AuthRepo({required this.sharedPreferences, required this.authRemoteDataSource});

 Future<DataState<String>> login({required String phone,required String password,})async{

  try {
    TokenModel tokenInfo=await authRemoteDataSource.login(phone: phone, password: password);
sharedPreferences.setString("token_info", jsonEncode(tokenInfo.toJson()));
 return const DataState.success("Login Successfully");
  } catch (e) {
       return DataState.failure(NetworkExceptions.getDioException(e));
  }
  }

  register(){


  }


Future<DataState<String>>  logOut()async{
  try {
    bool result=await authRemoteDataSource.logOut();
    if (result) return const DataState.success("Logout Successfully");

  return const DataState.failure(NetworkExceptions.unexpectedError());
  } catch (e) {
           return DataState.failure(NetworkExceptions.getDioException(e));

  }

  }
}