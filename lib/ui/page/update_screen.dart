

import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:find_people_flutter/data/source/pref/my_preference.dart';
import 'package:find_people_flutter/ui/page/updates_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
        title: Text('Update', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
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
            SizedBox(height: 16,),
            InkWell(
              onTap: ()async{
                final check = await location.checkPermission();
                final getLocation = await location.getCurrentLocation();
                controller.clickUpdate(
                    UserData(id: MyPreference.getId()?? "", name: textEditingController.text, lat:getLocation.lat, long: getLocation.long));
                final result = await AppRepositoryImpl.getAllUsers();
                Get.offAll(() => MapsScreen(result));

              },
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 16),
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
