import '../../../../../core/utilits/services/api/api_consumer.dart';
import '../../../../../core/utilits/services/api/dio_consumer.dart';
import '../../../../../core/utilits/services/api/end_points.dart';
import '../../models/login/token_model.dart';

class AuthRemoteDataSource {
  final DioConsumer dioConsumer;

  AuthRemoteDataSource({required this.dioConsumer});

 Future<TokenModel> login({required String phone,required String password,})async{
return TokenModel.fromJson(await dioConsumer.post(EndPoints.login) as Map<String, dynamic> );
  }

  register(){


  }
}