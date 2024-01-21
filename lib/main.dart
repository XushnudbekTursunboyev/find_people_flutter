import 'package:find_people_flutter/data/source/pref/my_preference.dart';
import 'package:find_people_flutter/ui/page/animation_page.dart';
import 'package:find_people_flutter/ui/page/login_page.dart';
import 'package:find_people_flutter/ui/controller/login_page_controller.dart';
import 'package:find_people_flutter/ui/page/maps_page.dart';
import 'package:find_people_flutter/ui/controller/maps_screen_controller.dart';
import 'package:find_people_flutter/ui/controller/splash_controller.dart';
import 'package:find_people_flutter/ui/page/splash_screen.dart';
import 'package:find_people_flutter/ui/page/update_screen.dart';
import 'package:find_people_flutter/ui/controller/updates_screen_controller.dart';
import 'package:find_people_flutter/ui/controller/users_page_controller.dart';
import 'package:find_people_flutter/utils/theme_change.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'firebase_options.dart';

void main() async{
  AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();
  MyPreference.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginScreenController());
    Get.put(MapsScreenController());
    Get.put(SplashScreenController());
    Get.put(UpdateScreenController());
    Get.put(UsersPageController());
    //AppRepositoryImpl.getAllUsers();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      initialRoute:"/" ,
      getPages: [
        GetPage(name: "/maps", page:() => MapsScreen([])),
        GetPage(name: "/login", page:() => LoginScreen()),
        GetPage(name: "/", page:() => SplashScreen()),
        GetPage(name: "/update", page:() => UpdateScreen()),
        GetPage(name: '/animation', page:() =>  AnimationPage())
      ],
    );
  }
}
