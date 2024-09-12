
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../service_locator.dart' as di;
import '../../../../config/routing/app_routes_info/app_routes_name.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(5);
// static OnboardingCubit get(BuildContext context)=> BlocProvider.of<OnboardingCubit>(context);



 navigateEvent(){
di.serviceLocator<SharedPreferences>().setBool("auth", true);
 Get.offNamed(AppRouteName.login);

 }
   
}