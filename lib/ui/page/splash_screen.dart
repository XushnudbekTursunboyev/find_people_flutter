
import 'dart:async';

import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:find_people_flutter/ui/page/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final controller = Get.find<SplashScreenController>();
    controller.requestPermission();
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
            child: Icon(Icons.location_searching, color: Colors.amberAccent, size: 36,)),
      ),
    );
  }
}
