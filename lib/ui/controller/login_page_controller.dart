
import 'package:find_people_flutter/data/app_repository_impl.dart';
import 'package:find_people_flutter/data/model/user_data.dart';
import 'package:find_people_flutter/data/source/pref/my_preference.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController{

  void clickLogin(UserData userData){
    AppRepositoryImpl.addUser(userData);
    MyPreference.register(userData.name, userData.lat, userData.long, userData.id);
  }
}