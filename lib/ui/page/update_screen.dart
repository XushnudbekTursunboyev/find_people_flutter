

import 'package:find_people_flutter/data/source/firebase/firebase_helper.dart';
import 'package:find_people_flutter/data/source/pref/my_preference.dart';
import 'package:find_people_flutter/ui/controller/updates_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/app_repository_impl.dart';
import '../../data/model/user_data.dart';
import '../../utils/location_service.dart';
import '../widgets/InputText.dart';
import 'maps_page.dart';

class UpdateScreen extends StatelessWidget {

  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final controller = Get.find<UpdateScreenController>();
    final LocationService location = LocationService();


    textEditingController.text = MyPreference.getName() ?? "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Update', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
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
                controller.clickUpdate(
                    UserData(id: MyPreference.getId()?? "", name: textEditingController.text, lat:getLocation.lat, long: getLocation.long));
                final result = await AppRepositoryImpl.getAllUsers();
                //await FirebaseHelper.addUser( UserData(id: MyPreference.getId()?? "", name: textEditingController.text, lat:getLocation.lat, long: getLocation.long));
                Get.back();
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amberAccent
                ),
                child: const Center(child: Text('Update')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
