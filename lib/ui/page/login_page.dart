

import 'package:find_people_flutter/data/model/user_data.dart';
import 'package:find_people_flutter/ui/controller/login_page_controller.dart';
import 'package:find_people_flutter/ui/page/maps_page.dart';
import 'package:find_people_flutter/ui/widgets/InputText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/app_repository_impl.dart';
import '../../utils/location_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final controller = Get.find<LoginScreenController>();
    final LocationService location = LocationService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
      ),

      body: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InputText('Name', TextInputType.text, textEditingController, '', 15),
            ),
            const SizedBox(height: 16,),
            InkWell(
              onTap: ()async{
                final getLocation = await location.getCurrentLocation();
                controller.clickLogin(UserData(id: '', name: textEditingController.text, lat:getLocation.lat, long: getLocation.long));
                final result = await AppRepositoryImpl.getAllUsers();
                Get.offAll(() => MapsScreen(result));

              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amberAccent
                ),
                child: const Center(child: Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
