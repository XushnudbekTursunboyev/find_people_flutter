
import 'package:find_people_flutter/ui/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final controller = Get.find<SplashScreenController>();
    controller.requestPermission();
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
            child: Icon(Icons.location_searching, color: Colors.amberAccent, size: 48,)),
      ),
    );
  }
}
