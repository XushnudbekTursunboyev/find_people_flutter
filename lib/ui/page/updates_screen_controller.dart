

import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/app_repository_impl.dart';
import '../../data/model/user_data.dart';
import '../../data/source/pref/my_preference.dart';

class UpdateScreenController extends GetxController{

  void clickUpdate(UserData userData){
    AppRepositoryImpl.addUser(userData);

    MyPreference.register(userData.name, userData.lat, userData.long, userData.id);
  }
}