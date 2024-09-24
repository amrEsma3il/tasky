import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data_state/api_result.dart';
import '../../../../core/errors/network_exceptions.dart';
import '../../../../core/utilits/services/network/network_info.dart';
import '../data_sources/remote_data_sources/auth_remote_data_source.dart';
import '../models/login/login_request_entity.dart';
import '../models/login/token_model.dart';
import '../models/profile_model.dart';
import '../models/user_model.dart';
// import '../../../../../service_locator.dart'as di;
class AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
final SharedPreferences sharedPreferences;
final NetworkInfo networkInfo;

  AuthRepo(this.networkInfo, {required this.sharedPreferences, required this.authRemoteDataSource});

 Future<DataState<String>> login({required String phone,required String password,})async{

  if (await networkInfo.isConnected) {
     try {
    TokenModel tokenInfo=await authRemoteDataSource.login(phone: phone, password: password);
sharedPreferences.setString("token_info", jsonEncode(tokenInfo.toJson()));
 return const DataState.success("Login Successfully");
  } catch (e) {
       return DataState.failure(NetworkExceptions.getDioException(e));
  }
  } else {
    return const DataState.failure(NetworkExceptions.noInternetConnection());
  }

 
  }

  Future<DataState<String>>  register(UserModel user)async{
if (await networkInfo.isConnected) {
  try {
  await authRemoteDataSource.register(user);
return  DataState.success("${user.displayName} register Successfully");
  } catch (e) {
       return DataState.failure(NetworkExceptions.getDioException(e));
  }
} else {
      return const DataState.failure(NetworkExceptions.noInternetConnection());

}

  }

Future<DataState<ProfileModel>> profile()async{

  if (await networkInfo.isConnected) {
    try {
ProfileModel result=await authRemoteDataSource.profile();
return  DataState.success(result);
  
} catch (e) {

  return DataState.failure(NetworkExceptions.getDioException(e));
}
  } else {
          return const DataState.failure(NetworkExceptions.noInternetConnection());

  }


}

Future<DataState<String>>  logOut()async{

  if (await networkInfo.isConnected) {
     try {
    bool result=await authRemoteDataSource.logOut();
    if (result) return const DataState.success("Logout Successfully");

  return const DataState.failure(NetworkExceptions.unexpectedError());
  } catch (e) {
           return DataState.failure(NetworkExceptions.getDioException(e));

  }
  } else {
    return const DataState.failure(NetworkExceptions.noInternetConnection());
  }
 

  }
}