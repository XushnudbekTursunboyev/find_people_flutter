

import 'package:find_people_flutter/ui/page/maps_page.dart';
import 'package:find_people_flutter/ui/controller/users_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/user_data.dart';
import '../../utils/theme_change.dart';

class UsersScreen extends StatelessWidget {
  final List<UserData> users;

  const UsersScreen(this.users, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UsersPageController>();
    controller.getBranches();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        automaticallyImplyLeading: false,
        title: const Text('Active users', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
        actions: [
          IconButton(onPressed: (){
            Get.to(MapsScreen(users));
          }, icon: const Icon(Icons.map_rounded, size: 24,)),

          IconButton(onPressed: (){
            Get.changeTheme(ThemeData.light());
          }, icon: const Icon(Icons.more_vert_rounded, size: 24,))
        ],
      ),
      body: Column(
        children: [

          Text(
            "Change Theme",
            style: TextStyle(fontSize: 16),
          ),
          Obx(
                () => Switch(
              value: controller.currentTheme.value == ThemeMode.dark,
              onChanged: (value) {
                controller.switchTheme();
                Get.changeThemeMode(controller.currentTheme.value);
              },
              activeColor: CustomTheme.white,
            ),
          ),

          Flexible(
            child: GetX(
              init: controller,
              builder:(context) {
                if(controller.loading.value) {
                  return  const Center(child: CircularProgressIndicator());
                }else{
                  return ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(right: 16, left: 16, top: 5),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFFD3B96A)
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 8,),
                              Text(controller.users[index].name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                              const Spacer(),
                              IconButton(onPressed: (){
                                List<UserData> list = [UserData(id: controller.users[index].id, name: controller.users[index].name, lat: controller.users[index].lat, long: controller.users[index].long)];
                                Get.to(MapsScreen(list));
                              }, icon: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey,))
                            ],
                          ),
                        );
                      });
                }
              }

            ),
          ),
        ],
      ),
    );
  }
}
