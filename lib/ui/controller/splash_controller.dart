

import 'dart:async';

import 'package:find_people_flutter/data/source/firebase/firebase_helper.dart';
import 'package:find_people_flutter/data/source/pref/my_preference.dart';
import 'package:find_people_flutter/ui/page/login_page.dart';
import 'package:find_people_flutter/ui/page/users_screen.dart';
import 'package:find_people_flutter/utils/location_service.dart';
import 'package:get/get.dart';

import '../../data/app_repository_impl.dart';

class SplashScreenController extends GetxController{
  final LocationService locationService =  LocationService();

  void requestPermission() async{
    //FirebaseHelper.fetchUserDataFromDatabase();
    await locationService.requestPermission();
    Timer(const Duration(seconds: 0), () async {
      if(MyPreference.isLogin() == false || MyPreference.isLogin().isNull) {
        Get.offAll(() => const LoginScreen());
      }else {
        final result = await AppRepositoryImpl.getAllUsers();

        Get.offAll(() => UsersScreen(result));
      }
    });
  }

}