

import 'dart:async';

import 'package:find_people_flutter/data/source/pref/my_preference.dart';
import 'package:find_people_flutter/ui/page/login_page.dart';
import 'package:find_people_flutter/ui/page/maps_page.dart';
import 'package:find_people_flutter/ui/page/users_screen.dart';
import 'package:find_people_flutter/utils/location_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/app_repository_impl.dart';

class SplashScreenController extends GetxController{
  final LocationService locationService =  LocationService();

  void requestPermission() async{
    await locationService.requestPermission();
    Timer(Duration(seconds: 0), () async {
      print('isLogin ${MyPreference.isLogin()}');
      if(MyPreference.isLogin() == false || MyPreference.isLogin().isNull) {
        Get.offAll(() => LoginScreen());
      }else {
        final result = await AppRepositoryImpl.getAllUsers();

        Get.offAll(() => UsersScreen(result));
      }
    });
  }

}